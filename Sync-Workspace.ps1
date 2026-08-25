<#
    Sync-Workspace.ps1 - back up the Chinese EV Research workspace to its own private repo.

    This workspace is deliberately OUTSIDE Supreme-Vault\Sync-Memory.ps1. Nothing here
    touches Supreme-Sentinel or the Supreme Obsidian vault, and this script must never be
    extended to cover another workspace. Keep the separation.

    Two folders, two git repositories, one remote, two branches:

      project  ->  <this folder>                                        branch main
      memory   ->  ~\.claude\projects\<encoded-path>\memory             branch memory-chinese-ev-research

    Per repo: commit anything uncommitted, push, then PROVE the push by comparing the
    remote SHA against the local one. A push that prints success is not evidence.

      .\Sync-Workspace.ps1           commit, push, verify
      .\Sync-Workspace.ps1 -Check    verify only; never commits, never pushes

    Two guards that matter:
      - If the remote has commits this machine does not have, the script STOPS rather than
        pushing. It will never force-push. Pull and re-run.
      - The memory path is DERIVED from this folder's path, not hardcoded, so renaming the
        project folder cannot silently point the backup at a stale memory directory.
#>
param([switch]$Check)

$ErrorActionPreference = 'Stop'

$remote = 'https://github.com/sheheryarasif2-cloud/Chinese-EV-Research.git'

# Claude Code encodes the working directory into the memory folder name by replacing
# ':', '\' and '.' with '-'. Derive it rather than hardcoding, so a folder rename fails
# loudly here instead of quietly backing up the wrong directory.
$encoded    = $PSScriptRoot -replace '[:\\.]', '-'
$memoryPath = Join-Path $env:USERPROFILE ".claude\projects\$encoded\memory"

$repos = @(
    @{ Name = 'project'; Path = $PSScriptRoot; Branch = 'main' }
    @{ Name = 'memory';  Path = $memoryPath;   Branch = 'memory-chinese-ev-research' }
)

# Native commands do NOT throw in PowerShell; they only set $LASTEXITCODE. Every git call
# goes through here so a failure cannot pass silently.
#
# Do NOT add "2>&1". In Windows PowerShell 5.1, redirecting a native command's stderr wraps
# each line in a NativeCommandError, which $ErrorActionPreference='Stop' then treats as
# terminating - so git's harmless "LF will be replaced by CRLF" warning becomes a fatal
# error. Exit code is the only honest signal; let stderr flow to the console.
function Invoke-Git {
    param([string[]]$Arguments, [string]$What)
    $prev = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try     { $out = & git @Arguments }
    finally { $ErrorActionPreference = $prev }
    if ($LASTEXITCODE -ne 0) {
        throw "git $($Arguments -join ' ') FAILED during '$What' (exit $LASTEXITCODE)"
    }
    return $out
}

function Get-RemoteSha {
    param([string]$Path, [string]$Branch)
    $line = Invoke-Git @('-C', $Path, 'ls-remote', 'origin', "refs/heads/$Branch") 'read remote sha'
    if (-not $line) { return $null }
    if ($line -is [array]) { $line = $line[0] }
    return ($line -split '\s+')[0]
}

$stamp     = Get-Date -Format 'yyyy-MM-dd HH:mm'
$committed = 0
$pushed    = 0
$problems  = @()

Write-Host "Chinese EV Research - workspace sync  ($stamp)" -ForegroundColor Cyan
if ($Check) { Write-Host "-Check: verifying only, nothing will be committed or pushed" -ForegroundColor DarkGray }
Write-Host "memory path derived as: $memoryPath" -ForegroundColor DarkGray

foreach ($r in $repos) {
    Write-Host "`n=== $($r.Name) ===" -ForegroundColor Cyan
    Write-Host "  $($r.Path)" -ForegroundColor DarkGray

    try {
        if (-not (Test-Path $r.Path)) {
            throw "folder not found. If the project folder was renamed, the derived memory path is now wrong - fix the rename or the encoding rule in this script."
        }
        if (-not (Test-Path (Join-Path $r.Path '.git'))) {
            throw "not a git repository"
        }

        $branch = Invoke-Git @('-C', $r.Path, 'rev-parse', '--abbrev-ref', 'HEAD') 'read branch'
        if ($branch -ne $r.Branch) {
            throw "on branch '$branch', expected '$($r.Branch)'. Refusing to touch it."
        }

        $origin = Invoke-Git @('-C', $r.Path, 'remote', 'get-url', 'origin') 'read remote url'
        if ($origin -ne $remote) {
            throw "origin is '$origin', expected '$remote'. Refusing to push."
        }

        # --- commit ---------------------------------------------------------------
        if (-not $Check) {
            $dirty = Invoke-Git @('-C', $r.Path, 'status', '--porcelain') 'read status'
            if ($dirty) {
                $n = ($dirty | Measure-Object).Count
                Write-Host "  $n uncommitted change(s), committing" -ForegroundColor Yellow
                Invoke-Git @('-C', $r.Path, 'add', '-A') 'stage' | Out-Null
                Invoke-Git @('-C', $r.Path, 'commit', '-q', '-m', "Sync $($r.Name) $stamp") 'commit' | Out-Null
                $committed++
            } else {
                Write-Host "  working tree clean" -ForegroundColor DarkGray
            }
        }

        $localSha = Invoke-Git @('-C', $r.Path, 'rev-parse', $r.Branch) 'read local sha'

        # --- refuse to clobber a remote that is ahead --------------------------------
        Invoke-Git @('-C', $r.Path, 'fetch', '-q', 'origin', $r.Branch) 'fetch' | Out-Null
        $remoteSha = Get-RemoteSha -Path $r.Path -Branch $r.Branch

        if ($remoteSha -and $remoteSha -ne $localSha) {
            $behind = Invoke-Git @('-C', $r.Path, 'rev-list', '--count', "$localSha..$remoteSha") 'count behind'
            if ([int]$behind -gt 0) {
                throw "remote is $behind commit(s) AHEAD of this machine. Pull and re-run. This script will not force-push."
            }
        }

        # --- push -------------------------------------------------------------------
        if (-not $Check) {
            if ($remoteSha -eq $localSha) {
                Write-Host "  already up to date on remote" -ForegroundColor DarkGray
            } else {
                Invoke-Git @('-C', $r.Path, 'push', '-q', 'origin', $r.Branch) 'push' | Out-Null
                $pushed++
                Write-Host "  pushed -> $($r.Branch)" -ForegroundColor Green
            }
        }

        # --- prove it ---------------------------------------------------------------
        # Re-read the remote. Do not trust the push's silence; an earlier version of the
        # Supreme script reported success while the operation had actually aborted.
        $verifySha = Get-RemoteSha -Path $r.Path -Branch $r.Branch
        if (-not $verifySha) {
            throw "branch '$($r.Branch)' does not exist on the remote after sync"
        }
        if ($verifySha -eq $localSha) {
            Write-Host "  VERIFIED: remote $($verifySha.Substring(0,7)) matches local" -ForegroundColor Green
        } else {
            throw "MISMATCH: local $($localSha.Substring(0,7)), remote $($verifySha.Substring(0,7)) - this folder is NOT backed up"
        }
    }
    catch {
        $msg = $_.Exception.Message.Split("`n")[0]
        Write-Host "  FAILED: $msg" -ForegroundColor Red
        $problems += "$($r.Name): $msg"
    }
}

Write-Host ""
if ($problems.Count -eq 0) {
    Write-Host "OK. Both folders verified against the remote." -ForegroundColor Green
    if ($committed) { Write-Host "$committed folder(s) had changes committed." -ForegroundColor Green }
    if ($pushed)    { Write-Host "$pushed folder(s) pushed." -ForegroundColor Green }
    exit 0
} else {
    Write-Host "SYNC INCOMPLETE - $($problems.Count) problem(s):" -ForegroundColor Red
    foreach ($p in $problems) { Write-Host "  - $p" -ForegroundColor Red }
    Write-Host "Treat any folder above that did not VERIFY as unbacked." -ForegroundColor Red
    exit 1
}
