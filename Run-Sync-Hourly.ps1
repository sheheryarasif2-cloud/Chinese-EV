<#
    Run-Sync-Hourly.ps1 - what the scheduled task calls.

    Sync-Workspace.ps1 is loud when run by hand, but nobody watches a scheduled run, so
    this writes ONE line per run to Sync-Workspace.log.

    It does NOT echo that script's summary. Sync-Workspace.ps1 emits everything through
    Write-Host, which never reaches the success stream, so a wrapper that captured its
    output would log a bare "OK" forever - a green light that proves nothing.

    Instead the outcome is MEASURED here, independently: for each folder, compare the local
    HEAD against the remote ref and confirm the working tree is clean. That is the same
    question a human would ask - "is my work actually on GitHub?" - answered without
    trusting anything the inner script said about itself.

    It deliberately does NOT redirect the inner script's streams. In Windows PowerShell 5.1
    redirecting a native command's stderr wraps each line in a NativeCommandError, which
    that script's own $ErrorActionPreference='Stop' would treat as fatal - the logging alone
    would turn a green run red.

    Scoped to THIS workspace only. Never extend it to another one; Supreme has its own.
#>
$log   = Join-Path $PSScriptRoot 'Sync-Workspace.log'
$stamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

$encoded    = $PSScriptRoot -replace '[:\\.]', '-'
$memoryPath = Join-Path $env:USERPROFILE ".claude\projects\$encoded\memory"

$targets = @(
    @{ Name = 'project'; Path = $PSScriptRoot; Branch = 'main' }
    @{ Name = 'memory';  Path = $memoryPath;   Branch = 'memory-chinese-ev-research' }
)

function Measure-Repo {
    param([string]$Path, [string]$Branch)
    if (-not (Test-Path (Join-Path $Path '.git'))) { return "no-repo" }
    Push-Location $Path
    try {
        $head  = (& git rev-parse HEAD)
        $dirty = @(& git status --porcelain).Count
        $line  = (& git ls-remote origin "refs/heads/$Branch")
        if ($LASTEXITCODE -ne 0) { return "remote-unreachable" }
        if (-not $line) { return "no-remote-branch" }
        if ($line -is [array]) { $line = $line[0] }
        $remote = ($line -split '\s+')[0]
        if ($dirty -gt 0)        { return "$dirty-uncommitted" }
        if ($remote -ne $head)   { return "not-pushed" }
        return $null
    } finally { Pop-Location }
}

try {
    & (Join-Path $PSScriptRoot 'Sync-Workspace.ps1') | Out-Null

    $bad = @()
    foreach ($t in $targets) {
        $problem = Measure-Repo -Path $t.Path -Branch $t.Branch
        if ($problem) { $bad += "$($t.Name):$problem" }
    }

    if ($bad.Count) {
        Add-Content $log -Value "$stamp  FAIL  $($bad -join ', ')" -Encoding utf8
        exit 1
    }

    $projectSha = (& git -C $PSScriptRoot rev-parse --short HEAD)
    $memorySha  = (& git -C $memoryPath   rev-parse --short HEAD)
    Add-Content $log -Value "$stamp  OK    both folders on remote [project=$projectSha, memory=$memorySha]" -Encoding utf8
}
catch {
    Add-Content $log -Value "$stamp  FAIL  $($_.Exception.Message.Split("`n")[0])" -Encoding utf8
    exit 1
}

# Keep the log bounded - 500 runs is about three weeks of hourly entries.
try {
    $lines = @(Get-Content -Path $log -ErrorAction Stop)
    if ($lines.Count -gt 500) { Set-Content $log -Value ($lines | Select-Object -Last 500) -Encoding utf8 }
} catch { }
