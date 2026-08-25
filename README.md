# Chinese-EV-Research

Private backup for a standalone Claude Code workspace. Two branches, two different things:

| Branch | Contents | Lives on disk at |
|---|---|---|
| `main` | Project instructions and working documents | `C:\Users\ESHOP\Documents\Chinese-EV-Research\` |
| `memory-chinese-ev-research` | Claude Code auto-memory for that workspace | `~\.claude\projects\C--Users-ESHOP-Documents-Chinese-EV-Research\memory\` |

The two are separate git repositories locally that share this one remote. Do not merge the
branches into each other.

**Start here:** `CLAUDE.md` on `main` carries the project's standing instructions, scope and
hard constraints. `01-question/kill-criteria.md` holds the go/no-go criteria.

This project is deliberately unconnected to the `Supreme-Sentinel` repo, the Supreme Obsidian
vault, and `Sync-Memory.ps1`. Keep it that way.

## Syncing

`Sync-Workspace.ps1` on `main` commits and pushes both folders, then verifies by comparing
remote SHAs against local. Run `-Check` to verify without changing anything.

It refuses to push on a wrong branch, an unexpected `origin`, or a remote that is ahead of
this machine — it never force-pushes. Nothing runs it on a schedule, so unpushed work is
unbacked work.
