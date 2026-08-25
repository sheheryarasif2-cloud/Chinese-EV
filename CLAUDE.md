# Chinese EV Research

*Global research on Chinese EV manufacturers, and an implementation roadmap for Pakistan.*

**Standalone workspace. Run Claude Code from this folder.**

The folder you start Claude in is the workspace selector. Started here, this project gets
its own memory and its own instructions, and **no other project's context loads** — not the
Supreme / Sentinel ERP memory, not Al Milhan, not the SR website. The only other thing that
loads is the small global `~/.claude/CLAUDE.md`, which is identity and universal rules only,
with no project detail in it. That is by design and cannot be switched off per-folder.

This project is not part of the Supreme group filing, and nothing here should be assumed to
belong to Supreme Renewables, ExaSnap, or any existing client unless this file says so.

## Memory

This workspace's memory lives at, and only at:

`~/.claude/projects/C--Users-ESHOP-Documents-Chinese-EV-Research/memory/`

Created 25-Aug-2026 and indexed by its own `MEMORY.md`. It is **separate from every other
workspace's memory** and shares nothing with them. A memory here that talks about Supreme,
the Sentinel ERP, Al Milhan or ExaSnap is in the wrong workspace — move it, don't keep it.

### Backup

**Decided 25-Aug-2026: this project gets its own private GitHub repo.** Nothing of it goes
into `Supreme-Sentinel` or the Supreme Obsidian vault, and it is not wired into
`Sync-Memory.ps1`. The separation is the point, and it is deliberate.

Two local git repositories, both to push to that one repo on different branches — the same
shape `Supreme-Sentinel` uses, applied to this project alone:

| Repo | Branch | Holds |
|---|---|---|
| `Documents\Chinese-EV-Research\` | `main` | Instructions and all working documents. |
| `~\.claude\projects\C--Users-ESHOP-Documents-Chinese-EV-Research\memory\` | `memory-chinese-ev-research` | The memory folder. |

The branch keeps its long name so it could be transplanted into another repo later without
colliding with anything.

🟢 **Live since 25-Aug-2026.** Remote is
`https://github.com/sheheryarasif2-cloud/Chinese-EV-Research.git` (private). Both branches
are pushed and both were verified by re-reading the remote SHAs, not by trusting the push
output. Both local branches track their remote.

### Syncing

**`Sync-Workspace.ps1`, in this folder, does both folders in one run.** It is this
workspace's own script and it covers only this workspace. `Supreme-Vault\Sync-Memory.ps1`
covers the three Supreme workspaces and this one is deliberately absent from it — never add
it there, and never extend this script to cover anything else.

```powershell
powershell -File "C:\Users\ESHOP\Documents\Chinese-EV-Research\Sync-Workspace.ps1"
```

`-Check` verifies against the remote without committing or pushing anything.

It commits both folders, pushes both branches, then **re-reads the remote and compares SHAs**
— a push that prints success is not evidence. Three guards, each of which stops that folder
and returns a non-zero exit:

- **Wrong branch** — refuses rather than pushing the wrong tree. *Proven to refuse.*
- **Remote ahead of this machine** — stops and tells you to pull. **It will never
  force-push.** *Proven to refuse.*
- **Unexpected `origin`** — refuses to push somewhere it does not recognise. *Proven to
  refuse, tested with origin pointed at `Supreme-Sentinel` — the exact mistake it exists to
  stop.*

All three were tested by making them fire, not by watching them pass. A gate that has only
ever been seen succeeding has not been tested. When this script is changed, re-prove each
one — the guards are the whole value, the happy path is trivial.

The memory path is **derived** from this folder's path, not hardcoded, so renaming the
project folder cannot silently back up a stale memory directory — it fails loudly instead.

⚠️ **Never merge the two branches into each other.** They are unrelated trees that happen to
share one remote — `main` is the project, `memory-chinese-ev-research` is the memory folder.

🔴 **Nothing runs this on a schedule.** Unpushed work is unbacked work.

## Who and what for

- **Owner and only audience:** Sheheryar Asif. Nobody else reads this unless that changes.
  Write for a reader who already has the context — no executive framing, no polish, no
  restating the previous section. Blunt is correct here. If something looks like a bad
  idea, say so in the document rather than softening it.
- **Deliverable:** a **living roadmap document** — a phased plan revised as policy, pricing
  and the competitive field move, not a report that gets finished and filed. It carries a
  last-revised date, and each section states how stale it is willing to be before it must
  be re-checked.
- **The decision it informs:** whether to **enter the EV business** — as importer,
  distributor, assembler, charging operator, or parts and service. A **go / no-go**, and if
  go, in which form.

## What this is

A standing, revisable answer to one question: **is there a business here for me, and if so
which one?** Chinese manufacturers are the supply side; Pakistan is the market and the
binding constraint. The document exists to reach a defensible go or no-go on entry, and
then — only if go — to say in what form, in what order, and against what capital.

## What "go / no-go" changes about the work

This is not a market study, and the difference is not cosmetic:

- 🔴 **A cheap, well-evidenced NO is a success, not a wasted project.** The expensive failure
  mode is a maybe that never resolves and quietly turns into spending.
- 🔴 **Write the kill criteria before the research, not after.** Name, in advance, the finding
  that would end this — a duty structure that kills the margin, a territory already locked
  by an existing distributor, a parts pipeline that cannot be made to work. Criteria written
  after the fact bend to the conclusion you already want.
- 🔴 **Front-load the deal-breakers.** Answer the questions most likely to produce a NO first.
  Market sizing is the last thing to do, not the first — it is only worth doing if nothing
  upstream has already disqualified the idea.
- ⚠️ **Name the entry mode before costing anything.** Importing built-up units, assembling,
  holding a dealership, running charging infrastructure and selling parts are five different
  businesses with different capital, different regulation and different competitors. A figure
  that does not say which one it belongs to means nothing.

## The two halves

The title implies two halves with **different evidence standards**, and keeping them apart
is the main discipline of this project:

1. **Global research** — what Chinese EV manufacturers actually do: model line-ups, pricing,
   battery chemistry, export strategy, joint ventures, after-sales networks. Desk research
   against published sources.
2. **Pakistan implementation roadmap** — what any of that means here: import duties and SROs,
   EV policy, grid capacity, charging infrastructure, financing, local assembly, servicing.
   Judgement built on Pakistani regulation and local conditions. Goes stale fastest.

## Hard constraints

- 🔴 **Never invent a figure.** No price, tariff, market share, unit sale, subsidy rate,
  range or charging time is written without a source and the date that source was published.
  `[PLACEHOLDER]` marks a genuinely unknown number — it is not a prompt to estimate one.
- 🔴 **Separate "true in China" from "true in Pakistan."** A Chinese sticker price is not a
  landed Pakistani price. A Chinese charging assumption presumes a grid Pakistan does not
  have. Never carry a figure across the border without stating what changes on the way.
- 🔴 **Date every policy claim.** Pakistani duty structures, SROs and EV incentives move by
  budget cycle. An undated tariff or incentive is worse than no number at all.
- ⚠️ **Three currencies, every one labelled.** Chinese-side figures stay **CNY**. Pakistani
  duties, prices and financing stay **PKR**. Global comparisons stay **USD**. Nothing is
  silently converted. Where a figure actually drives the decision, show all three, with the
  rate and the date used — a PKR figure with no rate and no date is not a figure.
- ⚠️ **A projection is never presented as a fact.** Forecasts are labelled, with their
  assumptions written beside them.

## Where things live

`CLAUDE.md` and `01-question/` exist. The rest below is the intended shape — each folder
gets created the first time it is actually needed, not up front.

| Path | Holds |
|---|---|
| `ROADMAP.md` | **The living document.** Everything else is working material feeding it. |
| `01-question/` | The go/no-go framing, the kill criteria, and what has been settled so far. |
| `02-supply/` | The Chinese side — manufacturers, models, pricing, export and JV behaviour. |
| `03-pakistan/` | Regulation, duty structure, EV policy, grid and charging, financing, demand. |
| `04-entry-modes/` | One file per candidate mode: import, assembly, dealership, charging, parts. |
| `05-numbers/` | Landed-cost workings, capital requirements, the assumptions behind each. |
| `06-sources/` | Saved copies of anything that could vanish — policy PDFs, price pages, tariff notifications. |

🔴 **`06-sources/` is not optional.** Pakistani SROs, budget documents and manufacturer price
pages get replaced without notice, and a roadmap resting on a dead link cannot be re-checked
later. Save the file, and record where and when it came from.

## Status

- **25-Aug-2026** — folder and this file created, then renamed from
  `Chinese EV Global Research And implementation roadmap in pakistan` to drop the spaces.
  The rename happened before any memory existed, so nothing was orphaned. No research yet.
- **25-Aug-2026** — scope settled: personal go/no-go on entering the EV business, kept as a
  living roadmap. Audience is the owner only.
- **25-Aug-2026** — kill criteria drafted at `01-question/kill-criteria.md`: 11 criteria in
  four tiers, cheapest-and-most-lethal first. **Five thresholds are still blank and only
  Sheheryar can set them (K1, K2, K5, K8, K9).** Two items are marked `[VERIFY]` — stated
  from general knowledge and not yet sourced. No research has started.
- **25-Aug-2026** — promoted to a full standalone workspace, named **Chinese EV Research**.
  Folder renamed to `Documents\Chinese-EV-Research`; its own memory folder created and
  committed to a local git repo on branch `memory-chinese-ev-research`. **No remote yet** —
  see Backup status above. Not wired into `Sync-Memory.ps1` and not mirrored into the
  Supreme vault, deliberately.
