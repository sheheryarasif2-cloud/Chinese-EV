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

🔴 **THE REMOTE MOVED ON 04-SEP-2026.** Both repos now push to
**`https://github.com/sheheryarasif2-cloud/Chinese-EV.git`** — a new, separate repository.
Both branches were pushed and both verified by re-reading the remote SHAs, not by trusting the
push output. Both local branches track it.

🟢 **The old repo `Chinese-EV-Research` is now a LIVE MIRROR, not a dead snapshot** (05-Sep-2026).
It is retained on both local repos as a second remote named **`archive`**, and
**`Sync-Workspace.ps1` now mirrors each branch to it after origin is verified** — same rules as
origin: never force-pushed, refused if it is somehow ahead, and proven by re-reading its SHA.
🔴 **A stale mirror FAILS the run**, because a backup allowed to lag silently is not a backup.
The block is skipped entirely on any repo without an `archive` remote, so it cannot break a
workspace that does not have one.
✅ **Both paths proven, not assumed** — `archive` was repointed at an empty bare repo and the run
went red (`ARCHIVE MISMATCH: local 5b5bebc, archive missing`, exit 1); restored, it went green
with all four VERIFIED lines. **Re-prove it the same way if this block is ever changed.**

🔴 **`Sync-Workspace.ps1` line 29 hardcodes the expected remote, and its origin guard refuses
to push anywhere it does not recognise.** That line was updated in the same change; had it not
been, the hourly task would have gone red on the next run. **If the remote ever moves again,
update line 29 in the same commit — the guard is not advisory, it throws.** Proven green after
the move with `-Check` (exit 0, both folders verified).

🟢 **What did NOT change, and therefore did not need touching:** the folder paths, the branch
names (`main` and `memory-chinese-ev-research`), the derived memory path, and the
`$externallyManaged` entry in the Supreme monitor's `Run-SyncMemory-Hourly.ps1` — that list
names the *branch*, not the remote.

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

### The scheduled task

**`Chinese EV Research Sync`** — a Windows scheduled task, hourly at **:39 past the hour**,
running `Run-Sync-Hourly.ps1` in this folder. It is deliberately offset from the Supreme
`Claude Memory Sync` task at :19 so two git-heavy jobs never run at once.

The wrapper writes **one line per run** to `Sync-Workspace.log` (gitignored — without that
rule each run would commit the log the previous run wrote, forever). Check it with:

```powershell
Get-Content "C:\Users\ESHOP\Documents\Chinese-EV-Research\Sync-Workspace.log" -Tail 10
```

`OK` means both folders were confirmed on the remote. `FAIL` names the folder and the cause.

🔴 **A green log is only worth something because the red path was tested.** On 25-Aug-2026
the wrapper logged `OK` while the memory repo sat on the wrong branch — it ignored the sync
script's exit code, and its sha check passed because the wrong branch pointed at the same
commit. Both holes are fixed: it now honours the exit code **and** checks the branch by name.
**If you change this wrapper, break it on purpose and confirm it goes red before trusting it
again.**

🔴 **This workspace is invisible to the Supreme backup, by design.** Creating its memory
folder initially broke `Run-SyncMemory-Hourly.ps1`, which scans every folder under
`~\.claude\projects\` and would have reported `no-mirror` on every hourly run. That script
now carries an `$externallyManaged` list naming this workspace's branch. **If this branch is
ever renamed, update that list too**, or the Supreme monitor goes permanently red and stops
meaning anything.

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
- 🔴 **UN Comtrade data must never be published.** Its licence prohibits redistribution —
  local use only. It may live in this private repo; it must **not** go into an Artifact, a
  shared page, or anything else that leaves this machine. **This constrains the deliverable
  itself:** if the roadmap is ever shared, the Comtrade-derived figures come out first.
- ⚠️ **Never average two mirror statistics.** China's reported exports and Pakistan's reported
  imports will disagree. Record both, say which is better evidenced, and leave the gap visible.

## Tools available

**`un-comtrade`** — MCP connector installed 25-Aug-2026, registered globally in `.claude.json`.
Nine `comtrade_*` tools giving official country-to-country trade volumes by HS code.
**Anchor code: HS 871160**, confirmed from the API as *"Motorcycles (including mopeds) and
cycles; fitted with auxiliary motor, with electric motor for propulsion"*.

🔴 **Two limits of the keyless free tier, both found the hard way:** only **one period per
call** — a multi-year query fails outright, so series are built year by year — and it
**rate-limits with HTTP 429** on rapid successive calls, needing roughly 15 seconds between
them. A free key from `comtradedeveloper.un.org` removes both; the owner would create that
account, and the key goes in the `env` block of the `.claude.json` entry.

⚠️ **Comtrade is country-to-country only.** It can never say which exporter shipped to which
importer. That is company-level shipment data, it sits behind paid services, and it has been
deliberately deferred.

## Where things live

`CLAUDE.md`, `01-question/`, `03-pakistan/` and `06-sources/` exist. The rest below is the
intended shape — each folder gets created the first time it is actually needed, not up front.

| Path | Holds |
|---|---|
| `ROADMAP.md` | **The living document.** Everything else is working material feeding it. |
| `01-question/` | The go/no-go framing, the kill criteria, and what has been settled so far. |
| `02-supply/` | The Chinese side — manufacturers, models, pricing, export and JV behaviour. |
| `03-pakistan/` | Regulation, duty structure, EV policy, grid and charging, financing, demand. |
| `04-entry-modes/` | One file per candidate mode: import, assembly, dealership, charging, parts. |
| `05-numbers/` | Landed-cost workings, capital requirements, the assumptions behind each. |
| `04-comparables/` | Other markets that already ran this cycle — India first. |
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
  from general knowledge and not yet sourced.
- **25-Aug-2026** — 🔴 **scope narrowed to electric TWO-WHEELERS** (motorcycles and scooters,
  not cars, and assumed not pedal-assist bicycles). **The kill criteria still carry car-shaped
  assumptions and have NOT yet been recalibrated — K5 especially**, which was set against car
  economics and may fire on almost any two-wheeler configuration. Do not lean on K5 until it
  is re-reasoned for this segment.
- **25-Aug-2026** — `un-comtrade` connector installed and verified. First sourced dataset
  recorded at `03-pakistan/import-volumes.md`: China→Pakistan HS 871160 exports grew from 888
  units (2020) to **46,716 units / US$16.3m FOB (2024)**, with average weight rising 30.9 →
  94.7 kg/unit — the mix moving out of the bicycle class into this project's actual segment.
- **25-Aug-2026** — first research pass. `02-supply/china-manufacturers.md` (top 10 Chinese
  makers = **94% of a 3.5m-unit market**, which is why no 5,000-company list exists) and three
  Pakistan files. Brief published as an Artifact and saved at `brief-2026-08-25.html`;
  Artifact URL `https://claude.ai/code/artifact/0fe92297-6716-461a-9678-be70ef67d5b8`.
- **25-Aug-2026** — 🔴 **primary sources reversed the headline conclusion.** The NEV Policy
  2025-30 says Pakistan already holds **~2m units/yr of e-2W/3W assembly capacity, "heavily
  underutilized"** — so local assembly is *not* the scarce input, and the earlier
  "CKD assembly is the surviving route" conclusion was withdrawn. The policy also puts the
  incentive regime's expiry at **30 June 2026 — already passed** — with all special duty
  regimes phased out by 2030. **A withdrawn figure:** the "~8–9% electric penetration" number
  was mine and was wrong — PAMA's membership excludes almost every electric maker, so the
  numerator and denominator counted different populations.
- **25-Aug-2026** — 🟢 **K6 UNBLOCKED. Tariff structure found** →
  `03-pakistan/tariff-structure-current.md`. Electric motorcycle = **PCT 8711.6040**;
  **1% CD on EV-specific CKD components**, 15% non-localised, under Table-II to Part-V(A),
  **Fifth Schedule, Customs Act 1969**. 🔴 **The 1% requires EDB certification and quota — it
  is not automatic.** The successor policy AIDEP 2026-31 is **still draft**, awaiting the PM
  and the IMF. **A correction to a correction:** the earlier "K7 already fired / concessions
  expired 30-Jun-2026" was wrong — the **Finance Act 2026 extended them one year to
  30-Jun-2027** ("sunset" is FBR's own word). **A policy's stated end date is not the law in
  force; the annual finance act overtakes it.** The cliff is now ~10 months out.
- **26-Aug-2026** — 🔴 **EDB certification decoded** → `03-pakistan/edb-certification.md`.
  **SRO 656(I)/2006 has NO electric-vehicle provisions** — the only "electric" in it is a crane
  hoist. The motorcycle schedule (Section D) an e-bike assembler is judged against mandates an
  **engine assembly line** (crankcases, crankshaft, spark plug, tappets, oil filling) and an
  **emission tester**. **An electric bike has none of those**, so certification rests on EDB
  discretion applying an obsolete instrument — **eligibility, cost and timeline cannot be
  self-assessed before applying.** Also required: Sales Tax Act registration; on-site facility
  verification; component lists approved by EDB/IOCO and uploaded to WeBOC; **annual input
  reconciliation by 15 August or the certificate is not revalidated.** 🟢 **Found an on-ramp:**
  AIDEP allowed **10 CBU/variant at 50% duty, max 200 units/company**, with manufacturing
  compulsory within 2 years — **but AIDEP expired 30-Jun-2026 and the two-wheeler pilot's
  survival is unconfirmed.**
- **26-Aug-2026** — research plan agreed → `01-question/research-plan.md`: 15 sections, 15 gaps
  added to the original 8-part outline. **Section D executed** →
  `04-comparables/india-fame-shakeout.md`.
- **26-Aug-2026** — 🔴 **INDIA CHANGES THE THESIS.** Its e-2W market **grew 53–75% while
  subsidies were slashed** — so demand survives policy withdrawal. **But the entire leaderboard
  was replaced: legacy petrol makers TVS, Bajaj, Hero plus Ather took 95.6% of incremental
  growth.** Ola Electric went from **>50% share (Apr-2024) to 6.8%** — beaten not on price or
  product but on **service capacity and spare parts**: 10,644 consumer complaints, warranty
  claims refused, and **Goa suspended its vehicle registrations**. **K8 is therefore the
  criterion that decides, not a secondary one**, and **K5 now carries a market-access
  consequence, not just a financial one** — both updated in `kill-criteria.md`. New priority
  open item: **quantify Atlas Honda's and United's dealer/service networks** — that number
  decides K11.
- **26-Aug-2026** — Sections **B** (`02-supply/battery-layer.md`) and **E**
  (`03-pakistan/petrol-baseline.md`) done. 🔴 **K11 is now very hard to answer positively:
  Atlas Honda holds ~85–88% share on ~1.69m units FY26, runs 500+ dealers and 63 service/parts
  points, and has ALREADY launched an electric scooter (Icon e) stating it needs no additional
  EV investment** — the exact India playbook, in Pakistan, at near-zero capex. Benchmark:
  **CD 70 = PKR 159,900, 55–60 km/l, ~PKR 5.85–6.10/km** at petrol of **PKR 343.10/l
  (25-Aug-2026, volatile)**. 🔴 **Battery: lead-acid dies in 12–15 months in Pakistani heat**
  (PKR 10–20k) vs lithium 3–5+ yrs (PKR 40–120k) — and the import evidence (~US$350/unit,
  ~95 kg) implies **lead-acid is what is arriving**, which is a direct K5 warranty trap. The
  1% concession reportedly covers *"batteries other than lead-acid"* — **verify; it may exclude
  the cheap route entirely.** 🟢 **Most promising thread: battery swapping** — recurring
  revenue, fits fleets, planned in the NEV Policy, and explicitly something Atlas Honda says it
  will not invest in.
- **26-Aug-2026** — Section **G** done → `05-numbers/tco-model.md`. 🟢 **THE CONSUMER ECONOMICS
  WORK, AND ROBUSTLY.** Yadea T5 (PKR 248,500, 2 kWh per 80 km per the maker) vs CD 70
  (PKR 159,900, PKR 5.72–6.24/km): **T5 runs at PKR 0.83/km at the average tariff and PKR 1.70/km
  even at the WORST domestic slab.** Payback **13–18 months with no subsidy**, and the case
  survives every battery assumption tested — even PKR 60,000 replaced every 15 months still
  saves PKR 1.69/km. 🔴 **With the PKR 65,000 subsidy payback is 3.9 months; without it, 14.5** —
  that is K7 in one number, and it tapers. 🔴 **NEW — THE SLAB-CROSSING TRAP:** charging adds
  ~31 kWh/month, so a household at 175–200 units/mo **crosses the 200-unit protected threshold
  and loses protected status on the WHOLE bill** — the target CD 70 buyer is exactly who this
  hits. It argues for charging away from home, and makes **solar charging a real differentiator.**
  **Net: demand is NOT the risk. The risk is entirely whether a new entrant can be the seller.**
- **26-Aug-2026** — 🟢 **FLEET MODEL — THE FIRST THESIS THAT SURVIVES EVERYTHING** →
  `05-numbers/fleet-model.md`. Riders run **80 km/day × 26 days = ~24,960 km/yr** (not 40,000);
  fuel is **PKR 17,841/mo — 30–71% of gross earnings of PKR 25,000–60,000.** E-bike payback
  **4.0–6.4 months with NO subsidy** vs 13–18 for consumers. **50,000+ known fleet riders**
  (foodpanda 20k, Bykea 30k) — PKR 50m buys ~200 machines, so **under 1% of that market is
  enough. First time the capital looks adequate rather than absurd.** 🔴 **For fleet, CYCLE life
  replaces calendar life** — 312–500 cycles/yr means **lead-acid dies in 8–13 months**, so
  chemistry becomes operational, not economic (both chemistries pay back alike). 🔴 **Swapping
  becomes structurally necessary** at 128 km/day vs 75–85 km range — benchmarks: 15% lower TCO,
  riders do **20–40% more orders, earn 15–35% more.** Fleet sidesteps K11 (buyers choose on
  arithmetic), the idle capacity, and the MOQ chasm — and targets what Atlas Honda **says it
  will not invest in.** ⚠️ Inherits K8/K5 as the decisive criteria: uptime IS the product.
  ⚠️ Open: **can a rider on PKR 35,000/mo fund PKR 248,500?** Model may have to be lease, not
  sale. ⚠️ Petrol price conflict: verified **343.10** vs press **414–415** — unresolved.
- **26-Aug-2026** — 📊 **INVESTOR DECISION BOARD published** →
  `decision-board-2026-08-26.html`, Artifact
  `https://claude.ai/code/artifact/4b804242-dd47-4db0-8f94-d8ddd1459013`. Ten navigable
  sections + a **live TCO calculator** (adjust km, petrol, tariff, battery cost, cycle life,
  subsidy → payback recomputes). Chart palette **computationally validated** with the dataviz
  validator — light and dark both pass all six checks. **Comtrade figures deliberately excluded**
  (licence prohibits redistribution). ⚠️ **Not visually inspected** — the in-app browser has no
  claude.ai session so a private artifact cannot be opened there; markup and JS wiring were
  validated structurally instead.
- **26-Aug-2026** — 🟢 **BOARD LAYOUT NOW VISUALLY VERIFIED.** 🔴 **Neither browser tool can
  inspect a published artifact:** the in-app browser has no claude.ai session AND cannot
  screenshot local files; real Chrome authenticates but the artifact sits in a genuinely
  cross-origin iframe (`*.frame.claudeuse`) that swallows scroll, ignores anchor jumps, blocks
  JS, and paints only its own viewport — stretching the frame element just yields blank space.
  ✅ **The method that works: headless Chrome full-page screenshot of the local HTML, then
  Read the PNG** (use a throwaway `--user-data-dir` per `windows-doc-toolchain`; slice tall
  renders with PIL before reading). Found and fixed 3 real defects that structural validation
  had missed: a bar encoding 13–18 at 80% when its siblings encoded the low value (→72%),
  slider `step` snapping the stated defaults (24,960→25,000; 33.4→33.5), and an awkward
  stat-label wrap.
- **26-Aug-2026** — 📣 **INVESTOR PITCH published** → `investor-pitch-2026-08-26.html`,
  Artifact `https://claude.ai/code/artifact/24c2ab52-0480-4304-8f49-734e61893aaa`.
  **Reordered and reframed, NOT softened** — opportunity-first, but Atlas Honda's ~88%, the
  India collapse, the June-2027 sunset and the three open gates all stay in, because a pitch
  that hides them would mislead an investor and sophisticated ones find them anyway. Leads on
  **PKR 17,841/month rider fuel spend vs PKR 1,736 on electricity.**
  🔴 **Raise amount, valuation and runway are `[PLACEHOLDER]` on purpose** — never decided, so
  any figure would be invented. Same for traction/team: none claimed because none exist.
  Carries a basis-of-preparation + "research summary, not an offer" disclosure.
  **Three deliverables now exist and serve different audiences:** `brief-` (working notes),
  `decision-board-` (own decision tool, leads with the uncomfortable), `investor-pitch-`
  (external, opportunity-first). **Keep them in sync or retire the stale ones.**
- **26-Aug-2026** — 🟢 **RIDER AFFORDABILITY SOLVED** → `05-numbers/rider-affordability.md`.
  **It was never an affordability problem, it was a financing-structure one.** Replacing petrol
  creates **PKR 16,105/mo = PKR 619 per working day** of headroom, so any charge below that
  leaves the rider better off with **no deposit, savings or credit history**. At **PKR 350/day
  the rider keeps PKR 7,005/mo and we collect PKR 9,100/mo**; asset recovered in 13–20 months.
  🔴 **The actual solve is the collection mechanism: the PLATFORM deducts from rider earnings
  before payout** — converting thousands of informal-worker credit risks into one B2B
  receivable. **No platform has been approached; this is now the single most important
  conversation, ahead of suppliers and banks.** 🟢 Proven template: **Zypp Electric (India)** —
  ₹100–300/day, 52-week rent-to-own, 20,000+ EVs, US$76.5m raised, same customer set.
  🔴 **NEW AND IMPORTANT: the Punjab E-Bike Scheme (PKR 15k down + PKR 2–3k/mo × 24 = PKR
  63–87k total) implies a large market segment FAR below the PKR 248,500 Yadea T5 this project
  has been anchored on.** At PKR 120–150k a bike, PKR 50m buys **333–416 machines** instead of
  201. **Price the cheap end — the benchmark may have been wrong all along.** (Scheme itself is
  students-only, balloted — riders are NOT eligible.) ⚠️ Trade-off: rental **locks capital
  13–20 months per machine** — this becomes asset finance with a supply arm, and should be
  funded as one.
- **26-Aug-2026** — 📚 **MODEL & PRICE CATALOGUES, four documents:**
  `03-pakistan/pakistan-models-and-prices.md` · `04-comparables/india-models-and-prices.md` ·
  `02-supply/china-models-and-prices.md` · `05-numbers/price-comparison.md`.
  🔴 **Pakistan's entry tier is PKR 145–210k — AT OR BELOW the CD 70's 159,900** — so the
  Yadea T5 at 245,000 this project anchored on is **mid-market, not the volume segment**.
  Five brands sit within PKR 15k of each other at entry; **nobody is differentiated on price.**
  🔴 **The value chain is now visible: audited Yadea ex-works ASP is RMB 1,878 for a scooter,
  and the same brand's T5 retails in Pakistan at PKR 245,000.** Everything between is the
  import stack — that is the business, and what K6 must model.
  🔴 **BIGGEST PRODUCT FINDING: Yadea's sodium-ion Q1/DE3 at CNY 3,299–3,499** — its entry
  models now use **no lithium at all** (92% capacity at −20°C, 80% charge in 15 min). If it
  reaches export it **resets the cost floor** and removes lithium price/supply risk. **Market
  leader deploying it, not a startup. Watch this.**
  ⚠️ India's mainstream starts at **₹74,000** on a subsidy cut to just ₹5,000/vehicle — **volume
  needed scale and localisation, not big subsidy.**
- **27-Aug-2026** — 📋 **MASTER LIST → `03-pakistan/MASTER-model-price-list.md`: ~90 Pakistani
  models, 13 brands, exact prices**, pulled per-brand from PakWheels.
  🟢 **ATLAS HONDA ICON e: FOUND — PKR 419,900**, 1500W, **Li-ion 1.58 kWh FIXED
  (non-swappable)**, **65 km range**, 55 km/h, **6h charge, proprietary charger, NO fast
  charge**, 86 kg. **It is 2.6× a CD 70 with LESS range than a Yadea T5 — and structurally
  useless for fleet** (a rider doing 80–128 km/day cannot use a 65 km fixed-pack machine).
  **The incumbent took a premium CONSUMER position, not a fleet one — the fleet gap is
  confirmed open by the only company that could have closed it.**
  🔴 **CORRECTION: the entry point is far lower than recorded.** **Evee Flipper PKR 97,000** and
  **REVOO A04 PKR 100,000** sit WELL BELOW the CD 70's 159,900 — the earlier "entry tier is
  145–210k" note is **superseded**. ~35 models from 10 brands sit in 150–250k; **nothing is
  differentiated on price.**
  🔴 **The lithium premium is now measurable like-for-like:** MS Jaguar Bolt 174,000 standard vs
  **245,000 LFP (+71,000)**; REVOO A11 +42,000, A12 +62,000. **That is the key number for a
  fleet buyer**, since lead-acid dies in 8–13 months at fleet cycles.
  ⚠️ Crown contradiction: its own site markets its line as electric, PakWheels lists it as
  non-electric — resolve before relying on either.
- **27-Aug-2026** — 📋 **INDIA + CHINA MASTER LISTS** →
  `04-comparables/MASTER-india-model-price-list.md` (**36 current models + 8 upcoming, with top
  speed / range / weight / kWh**) and `02-supply/MASTER-china-model-price-list.md`.
  🔴 **INDIA vs PAKISTAN — the structural gap:** Indian mainstream scooters carry **2.5–5.3 kWh
  and do 102–212 km**; Pakistan's carry **1.58–1.8 kWh and do 65–90 km**. **Honda sells a 102 km
  Activa e in India and a 65 km ICON e: in Pakistan** — same maker, same segment, materially
  worse product. India's entry is **Lectrix SX25 ₹54,999** (25 kmph low-speed class — **Pakistan
  has no equivalent regulatory category; worth checking, it would open a tier below PKR 97,000**).
  ⚠️ India's next wave is **Suzuki, TVS, Honda, Vinfast** — legacy makers and a funded foreign
  entrant, not startups.
  🔴 **CHINA — the cost basis, now anchored:** audited ex-works ASP **RMB 1,415 (e-bicycle) /
  1,878 (e-scooter)**, and Chinese **domestic retail is CNY 2,999–3,899** for a mainstream
  60–80 km machine (Tailg 2,999; Tailg M6 3,899; Yadea sodium Q1/DE3 3,299–3,499). **Domestic
  distribution margin is thin — the gap to Pakistani retail is almost entirely freight, duty,
  tax and margin.** ⚠️ **The cheap Chinese tier runs on GRAPHENE = lead-acid** — the price
  advantage and the 8–13-month fleet failure mode arrive together.
  🔴 **China CANNOT be enumerated like the other two** — hundreds of makers, thousands of SKUs,
  brand sites geo-blocked (yadea.com.cn 404s from here), real pricing on Tmall/JD behind
  sessions, heavy white-labelling. **Anyone offering a complete Chinese model list is scraping
  B2B storefronts or inventing it.**
- **27-Aug-2026** — 🟢 **CKD KIT PRICES FOUND** → `05-numbers/ckd-kit-pricing.md`. Alibaba
  geo-localises to PKR, so these are the numbers a Pakistani buyer sees.
  **Complete CKD kits list at PKR 51,706–93,121 at MOQ 50** — KeywayEV K037 (12″, 72V,
  1001–2000W) **PKR 51,706 @ 50**; CKD SKD 10″ 600/800W **55,748 @ 50**; SAIGE EV EEC 1500W
  **57,617–59,174**; CKD EEC 10″ **61,977 @ 50**. **A 50-kit first order is ~PKR 2.75m — 5.5% of
  the PKR 50m ceiling.** Against Pakistani retail (cheapest 97,000; volume band 150–250k; T5
  253,500) **the import stack has real margin, not assumed margin — first hard evidence of it.**
  🔴 **BUT: the battery is almost certainly NOT included.** The one listing that bundles
  batteries (3000W + lead-acid) is **PKR 348,189–354,418 — ~6× the battery-less kits.** So
  **true landed cost = kit + battery, and the battery may exceed the kit.** The favourable
  arithmetic is only half the picture until battery import cost is known.
  ⚠️ These are **self-declared listing prices, Alibaba's undated FX — NOT quotes.** No supplier
  contacted, no RFQ sent, no account created. ⚠️ "CKD kit" has no consistent definition —
  some are complete-vehicle-minus-battery, some are motor+controller conversion kits.
  📇 Named for RFQ: **KeywayEV · SAIGE EV Group · Benlg (⚠️ check vs Pakistani "Benling") ·
  LVJIAN · Xuchang Hengna** + MDKA/Legend/Taiya. An 8-point RFQ checklist is in the file.
- **25-Aug-2026** — promoted to a full standalone workspace, named **Chinese EV Research**.
  Folder renamed to `Documents\Chinese-EV-Research`; its own memory folder created and
  committed to a local git repo on branch `memory-chinese-ev-research`. **No remote yet** —
  see Backup status above. Not wired into `Sync-Memory.ps1` and not mirrored into the
  Supreme vault, deliberately.

🔴 **THE BULLET LIST ABOVE ENDS ON 27-AUG-2026. IT IS NOT THE END OF THE RECORD.** From 27-Aug the
log switched to full dated sections below, one per working session, and they run to **01-Sep-2026**.
**Read to the bottom of this file** — the last two sections (*the maintained deliverable* and *what
the 28-Aug → 01-Sep work did to the decision*) are the current state, and several bullets above have
since been corrected there.

---

## 27-Aug-2026 — PDF deliverables, and three evidence gaps closed

**Requested:** combine the research into a master PDF, put the artifacts into PDFs, focus only
on research. Then: use Firecrawl / scraping connectors for more information.

### 🔴 Firecrawl is NOT available in this environment
`search_mcp_registry` returns **zero results** for firecrawl, scrape, crawl, web-scraping and
extract. No generic scraping connector exists in the registry to install. **Do not promise one.**

**What actually works, in order of usefulness:**
1. **Real Chrome (`claude-in-chrome`) + `get_page_text`** — beat every block. Got the dated FX
   table off Forex.pk after WebFetch returned only a "Loading…" widget.
2. **WebFetch on a direct product URL** — works where the *search* page is blocked. Made-in-China
   search returned "information is not available right now"; its product pages returned full
   price tiers.
3. ⚠️ **`javascript_tool` is fragile here** — Alibaba froze the renderer (CDP timeout 45s), and
   one extraction was refused as `[BLOCKED: Cookie/query string data]`. **`get_page_text` is the
   reliable path; JS is not.**

### 🟢 GAP 1 CLOSED — battery import cost → `05-numbers/battery-import-cost.md`
Three named suppliers, published quantity tiers, FOB Shenzhen/Guangzhou.
**The finding is not the price, it is the spread:** at the same 50-unit tier the same nominal
72V/30–35Ah pack is **PKR 59,281 (Koyosonic)** or **PKR 113,939 (Hunan CTS)** — the latter equals
Pakistani retail (PKR 115,000) *before* freight, duty or tax.
🔴 **The arbitrage is a property of the SUPPLIER, not of the trade.** Also confirmed: **the
battery is 53% of FOB cost** (kit 51,706 + battery 59,281 = **110,987 FOB**), and **1,500 cycles
@90% DOD = 3.0–4.8 fleet years**, but warranty is **1 year below 50Ah** — the K5 exposure, exactly.

### 🟢 GAP 2 CLOSED — dated FX rate → `05-numbers/fx-rates.md`
**Thu 27-Aug-2026 15:56 PST — USD/PKR 277.40/277.90, CNY/PKR 41.26/41.34** (Forex.pk,
*indicative interbank, not a dealing rate*). First dated rate in the project; unblocks every
`[PLACEHOLDER: rate + date]`.
🔴 **Yadea's audited ex-works scooter ASP = PKR 77,636. The Yadea T5 retails in Pakistan at
253,500 — a 3.3× multiple.** And **China's own retail (PKR 124,000–161,000) sits INSIDE Pakistan's
volume band**, already carrying Chinese distribution margin. That premium is the opportunity —
and precisely what a local assembler on the 1% CKD rate can compete away.

### 🟢 GAP 3 CLOSED — petrol price → appended to `03-pakistan/petrol-baseline.md`
**PKR 343.10 is CORRECT; the 414–415 press figure is wrong.** Month ran 329.82→343.10 across four
independently reported notification dates.
🔴 **Structural discovery: Pakistan reprices petrol DAILY since Aug 2026** under a new OGRA
mechanism (the 26-Aug notification was valid "until August 27"). **No petrol figure may be quoted
as "the price" again — only as the price on a stated date.** Strengthens the fleet pitch
(volatility is what an e-bike removes); adds a risk (a crude fall now reaches the pump in days).

### PDFs → `PDF/` (58 → 51 pages total)
`01-Master-Research-Dossier.pdf` (13pp, A4) · `02-Decision-Board.pdf` (12pp) ·
`03-Investor-Pitch.pdf` (10pp) · `04-Opening-Brief.pdf` (16pp).
Source of the master is now tracked as `master-research-dossier.html`.

⚠️ **Print-CSS lesson: `page-break-before:always` on every section CREATED dead pages.** A section
running slightly long orphaned its trailing `page-break-inside:avoid` block, then the next forced
break left the rest blank — a 301-char page. **Flowing the sections and adding
`page-break-after:avoid` on h2/h3 took 20pp → 13pp with no loss.** Verify with per-page
`pdftotext | wc -c`, not by eye.
✅ **Checked and TRUE:** the Decision Board's hidden tab content DOES print (FAME, Ola, Huaihai,
Atlas Honda all present in the PDF text) — the tabs are CSS-hidden, not absent from the DOM.

---

## 27-Aug-2026 (later) — the Fifth Schedule's own words + the battery tariff lines

**Requested:** get the Fifth Schedule primary text and the battery HS code. **Both obtained.**
New file: `03-pakistan/fifth-schedule-primary-text.md`. Source PDF + extracted text archived as
`06-sources/fbr-fifth-schedule-FY2025-26.*` (87pp, FBR, created 5-Aug-2025).

### 🔴 THREE CORRECTIONS TO THIS PROJECT'S OWN PRIOR WORK
1. **Non-localised CKD is 15%, NOT "10–15%."** That range came from FBR's budget *summary* and was
   wrong. **Corrected in 5 files.** Localised parts are **15% + ACD under SRO 693(I)/2006** —
   *dearer* than non-localised, which is the design.
2. **The operative regime is EV Policy 2020**, not NEV Policy 2025-30. The NEV policy has **no
   Fifth Schedule table yet.**
3. 🔴 **The printed text says "five years from 1st July, 2020" = expired 30-Jun-2025.** It is NOT
   expired — Finance Act 2026 moved it to 30-Jun-2027. **This is the same trap as before: a
   policy's stated end date is not the law in force.** ⚠️ **The FY2026-27 Fifth Schedule is NOT
   PUBLISHED** — fbr.gov.pk/Budget2026-27/CustomsSchedules* returns **404**; only Salient Features
   is posted. **The most load-bearing date in the project rests on a summary + press.**

### 🟢 THE BATTERY HS CODE — it is THREE answers, not one
- **Route A · 1%** — *"Batteries other than lead acid (**PCT code 85.07**)"*, Part-V(A) Table-II
  sr.3(i)(g). 🔴 **LEAD-ACID IS EXPRESSLY EXCLUDED** in all three 2-3 wheeler serials — the tariff
  will not subsidise the chemistry that dies in 8–13 months. Needs **EDB** certification.
- **Route B · 0%** — **Lithium Ion Cells 8507.6000**, Fifth Schedule **Part-I sr.143**, for a
  Sales-Tax-registered maker *of lithium-ion batteries*, **IOCO** quota.
- **Route C · 0%** — **"Parts of Lithium Batteries"**, Part-I, a **13-line pack BOM** (cells/BMS/
  casing 8507.9000, copper bar 7407.1010, harness+cables 8544.4290, DC breaker 8536.2010/20/90 …)
  for a registered **lithium battery assembler**, IOCO quota.
🔴 **Routes B and C need NO EDB VEHICLE CERTIFICATION.** The state built a lower barrier into the
battery than into the vehicle — and the battery is **53% of FOB cost.** Worth testing on its own.

### Statutory rates if you do NOT qualify — TIPP (Pakistan Single Window), read 27-Aug
- **8507.6000:** CD **10%** · RD **2%** (01-07-2026→30-06-2027) · ST **18%** · IT **11%**
- **8711.6040 e-motorcycle CBU:** CD **30%** · ACD **4%** (both from **01-07-2026**) · ST **18%** ·
  IT **12%**   *(8711.6060 loader is identical)*
- Provincial cess: **Sindh 1.80–1.85%** · Punjab 0.90% · KPK 2% · Balochistan 1.10–1.50%
- 🔴 **PSQCA Release Certificate is a listed requirement on 8507.6000** — non-conforming shipments
  **destroyed**. ⚠️ **Pak-China FTA on 8507.6000 (4.58%) EXPIRED 31-12-2023** — assume no preference.
- ⚠️ **No total incidence is stated anywhere** — ST and IT apply to duty-inclusive value and the
  stacking order is a clearing-agent question. **Do not invent one.**
🟢 **The prize is not the 1% — it is not paying 30+4+18+12 on a CBU.** And the gate to it is EDB
against **SRO 656(I)/2006**, now confirmed *from the primary text* as the operative condition.
**K7 and the EDB question are ONE risk, not two.**

### ⚠️ A DRAFTING DEFECT IN THE SCHEDULE ITSELF
Sr.3 gives **Converter = PCT 8454.1000**. **8454 is metallurgical** — "converters, ladles, ingot
moulds and casting machines … used in metallurgy." Sr.1 (auto rickshaw) gives **8502.4000**
(*electric rotary converters*) for the same component. **Declaring a DC-DC converter under
8454.1000 declares a steel converter.** Ask a clearing agent before goods ship — paperwork this
size ended Hero Electric and Okinawa.

### Tooling notes
- **TIPP (`tipp.gov.pk`) is the best Pakistani tariff source found** — statutory CD/ACD/RD/ST/IT
  with validity dates, provincial cess, measures and SRO cross-refs. **Its search form ignores URL
  params; navigate `?r=tradeInfo/view&id=N` directly.** Known ids: **27751**=8507.6000,
  **22719**=8711.6040, **22721**=8711.6060.
- 🔴 **`javascript_tool` was BLOCKED again** (`[BLOCKED: Cookie/query string data]`) on TIPP —
  second time today. **`get_page_text` worked every time. Stop reaching for JS.**
- ⚠️ **TIPP contradicts itself** on SRO 929(I)/2024 sr.3(xi): description says *"till 30th June,
  2025"*, `valid_to` field says **31-12-2040**. Read the SRO.

---

## 27-Aug-2026 (later still) — 🟢 THE FY2026-27 FIFTH SCHEDULE, OBTAINED

**Requested:** get the FY2026-27 Fifth Schedule or the SRO. **Got both.**

### 🔴 WHY IT COULD NOT BE FOUND: IT IS NOT A SEPARATE DOCUMENT
**Finance Act 2026 s.3(14):** *"The Fifth Schedule to the Customs Act, 1969 shall be **substituted**
in the manner provided for in the **Second Schedule to this Act**."*
**The FY2026-27 Fifth Schedule IS the Second Schedule to the Finance Act 2026.** Whole schedule
replaced, not amended. **Stop looking for a standalone FY2026-27 PDF on fbr.gov.pk — there isn't one.**
Source: `download1.fbr.gov.pk/Docs/20266291261044366FinanceAct2026.pdf` → `06-sources/finance-act-2026.pdf`
(Gazette of Pakistan Extraordinary Part I, 26-Jun-2026, 256pp, in force 1-Jul-2026).
⚠️ **Pages 77–255 are SCANNED IMAGES** — `pdftotext` yields 213K chars and **misses every schedule**;
179/256 pages return <60 chars. No tesseract on this machine. **Read them with `pdftoppm` + vision.**
🔎 **Page map: Gazette page = PDF page + 526.** Part-V(A) Table-I = PDF p240 · **Table-II sr.3 = PDF p243.**

### 🟢 K7 SETTLED IN PRIMARY LAW — Gazette p769, verbatim
> *"The concession shall be admissible to manufacturers of electric motorcycle **on and from the
> 1st day of July, 2025 till 30th day of June, 2027** subject to certification and quota
> determination by the Engineering Development Board (EDB)."*

The FY2025-26 wording (*"five years from 1st July, 2020"*) was **replaced outright**, not extended
by proviso. Table-I sr.7/8 moved **2026 → 2027** identically (Gazette p766).
🔴 **~10 months of runway.** EDB cert + supplier + LC + 15–45d lead + 25–35d sea must all fit inside.
**The decision window is much shorter than the concession window.**
🔴 **Everything else in sr.3 carried forward UNCHANGED — including the 8454.1000 converter typo.**
**A wholesale substitution of the entire schedule did not fix it.** It is not a transcription slip
in the old edition; it is the law.

### 🔴 CORRECTION TO YESTERDAY: THE 4% ACD IS NOT PAYABLE
**S.R.O. 1063(I)/2026, 30-Jun-2026**, s.18(5), **in supersession of SRO 1151(I)/2025**, effective
**1-Jul-2026** → `06-sources/sro-1063-2026-acd.pdf`. Para 3 — ACD **shall not be levied** on:
- **(xi) "Imports under PCT codes 8703.8030, 8711.6040 and 8711.6060"** ← **no expiry attached**
- (iii) imports **under the Fifth Schedule** — *excluding* Part-I sr.30/33/35 and Part-III
  sr.102/111/116(except xvi)/117/118 → **so 1% CKD components carry no ACD either**
- (vii) imports under **SRO 693(I)/2006** → **no double ACD on localised parts**

🟢 **This also kills the TIPP contradiction:** TIPP still cites superseded **SRO 929(I)/2024**
(*"till 30th June, 2025"* vs `valid_to` 31-12-2040). **Neither is right — 1063 re-enacted it.**
⚠️ **TIPP's tariff table is current (shows 01-07-2026 rates) but its EXEMPTION list is STALE.**

### ⚠️ NOT CONFIRMED — the two 0% battery routes
Routes B (Lithium Ion Cells 8507.6000, Part-I sr.143) and C ("Parts of Lithium Batteries") were
read from the **FY2025-26** schedule. **Part-I was RENUMBERED by the substitution** — PDF p238
(Gazette 764) shows serials **17–43 all "Omitted"**. Probed p190/192/194/238 and did not relocate
the lithium block. **Route A (1%) is confirmed current; B and C are LEADS, not findings.**
Next attempt: TIPP for **8507.9000** (the cells/BMS/casing code) — its exemption list names the
Part and serial, though note the staleness caveat above.

### Deliverables
`03-pakistan/fifth-schedule-primary-text.md` rewritten (§2A the substituted schedule, §2B the ACD
correction). Master dossier now **15pp**. Sources archived: Finance Act (42MB), SRO 1063.

---

## 27-Aug-2026 — the sync "commit FAILED" false alarm: what it was NOT

🔴 **I misdiagnosed this first. `core.safecrlf` is NOT set.** Running
`git config --get core.safecrlf; git config --get core.autocrlf` printed one `true` and one
blank, and I attributed the `true` to the wrong setting. **`core.autocrlf=true` is set — from
`C:/Program Files/Git/etc/gitconfig`, the normal Git-for-Windows default. `core.safecrlf` is
unset.** ⚠️ **Never read a value off a two-command output without labelling which printed it.**

### What actually happened
At 17:39 `Sync-Workspace.ps1` threw `FAILED during 'commit' (exit 1)` — **while the commit
(`24385af`) landed perfectly intact**, 42MB Finance Act included. Re-running pushed it cleanly.

### Ruled out by experiment, not reasoning
| Hypothesis | Test | Result |
|---|---|---|
| `core.safecrlf=true` | `config --show-origin --get-all` | **not set at all** |
| CRLF warnings → non-zero | LF file through the real wrapper | **exit 0** |
| 42MB binary → non-zero | 42MB random binary, throwaway repo | **exit 0** |
| commit/post-commit hook | `ls .git/hooks` | **none active** |
| failed auto-gc | `.git/gc.log`, `count-objects` | **no log, 239 loose objects** |

**Not reproducible.** Treated as a one-off, cause unknown. **Do not "fix" it by guessing again.**

### 🟢 The real fix: stop trusting an intermediate exit code
`Sync-Workspace.ps1` now, on commit, **asks the repository what happened** instead of believing
the exit code: it records HEAD before, runs commit outside the throwing wrapper, then re-reads
HEAD and `status --porcelain`.
- **HEAD unmoved OR changes remain → still throws.** Real failures still fail hard.
- **HEAD moved AND tree clean but exit ≠ 0 → prints a NOTE and continues**, because the proof
  this script rests on is the **remote-SHA comparison**, never an intermediate exit code.

🟢 **Both paths PROVEN, not assumed** — happy path commits at exit 0; a planted `.git/index.lock`
gives exit 128 / HEAD unmoved / tree dirty and **the guard fires**. Live run: `2a4c958`, verified.

⚠️ **The Supreme workspace's sync scripts have the same "trust the exit code" shape** and were
NOT touched. Worth the same treatment if it ever false-alarms there.

---

## 27-Aug-2026 (evening) — all battery routes settled, plus two findings nobody looked for

### 🔧 TOOLING: tesseract 4.1.1 installed in WSL (`sudo apt-get install tesseract-ocr`)
🔴 **This is the unlock for the Finance Act.** Pages 77–255 are SCANNED IMAGES; `pdftotext` misses
every schedule. Blind page-probing failed four times. **OCR made all 92 schedule pages greppable
in one pass** (`pdftoppm -r 200` → `tesseract --psm 6`), ~25 min.
Archived: `06-sources/finance-act-2026-schedules-OCR.txt`. 🔎 **Gazette page = PDF page + 526.**

### 🟢 ALL FOUR BATTERY ROUTES CONFIRMED IN THE SUBSTITUTED SCHEDULE
| Route | Where | Duty | Gate |
|---|---|---|---|
| **A** pack as EV CKD component, 85.07 "other than lead acid" | Part-V(A) T-II sr.3 | 1% | **EDB vehicle cert (SRO 656)** |
| **B** **Lithium Ion Cells 8507.6000** | **Part-III sr.143** (Gazette 761-2) | **0%** | 🟢 Sales Tax reg + IOCO. **NO EDB** |
| **C** Parts of Lithium Batteries (13-line BOM) | **Part-I** (Gazette 700) | **0%** | Sales Tax reg + IOCO **+ Part-I locally-manufactured test (EDB may certify)** |
| **D** Li-battery *manufacturing equipment* | Part-I sr.6(d) | 0% | EDB Annex-B. ⚠️ mostly "Omitted" now |

🔴 **CITATION CORRECTED: sr.143 is PART-III ("Raw Materials/Inputs … Other Goods"), NOT Part-I.**
Part-III's conditions are online info-furnishing ONLY — read in full, **no EDB, no local-manufacture
test**. ⚠️ **And my "Routes B and C need no EDB at all" was TOO STRONG for C** — Part-I's note
requires goods not be on the locally-manufactured CGO list *or* be EDB-certified as such.
**Route C ≠ Route B. Do not merge them again.**
⚠️ Route C trimmed by the substitution: **copper bar 7407.1010 OMITTED**, 2 of 3 DC-breaker codes
omitted. **Cells and BMS card both survive.**

### 🟢 ROUTE E — the cleanest concession in the schedule, and nobody had looked for it
**"Charging station for electric vehicle · 8504.4030 · 0% · Condition: Nil"** (Part-I, Gazette 707).
🔴 **"Nil" is the ENTIRE condition column** — no EDB, no IOCO, no Sales Tax test, no cap, no expiry.
**Uptime is the fleet product; the hardware that fixes it lands duty-free.** ⚠️ 8504.4030 is a
*static converter* line — a swap cabinet may classify elsewhere; and nothing here covers the
K-Electric connection, where the real cost/delay sits.

### 🔴 CHEMISTRY IS TAXED 2× — lithium wins twice
| | CD | ACD | RD | pre-tax |
|---|---|---|---|---|
| **8507.6000 lithium** | 10% | — | 2% | **12%** |
| **8507.2000 lead-acid (traction)** | 20% | 2% | 2% | **24%** |
| **8507.1010 lead-acid starter, expressly "vehicles of heading 87.11"** | 25% | 11% | — | **36%** |
Lead-acid is **excluded from the 1% concession by name AND carries double the duty.** 🟢 **Policy and
engineering agree for once** — the graphene/lead-acid tier that dies in 8–13 months is also the one
the border taxes hardest. ⚠️ **TIPP prints the SAME 12-digit product string on 8507.2000 and
8507.6000** — its sub-code descriptions are demonstrably unreliable.
🔎 TIPP ids: **27746**=8504.4090 · **27749**=8507.1010 · **27750**=8507.2000 · **27751**=8507.6000.

### 🟢 NO LOW-SPEED CLASS EXISTS → `03-pakistan/vehicle-class-and-registration.md`
**Provincial Motor Vehicles Ordinance 1965**, read in full. *"motor vehicle"* = mechanically
propelled, road-adapted, *"whether … from an external or internal source"*; *"motor cycle"* = <4
wheels, unladen ≤ **900 lb (408 kg)**. 🔴 **NO wattage/kW/cc/speed threshold anywhere**, and s.23(1)
is unconditional. **Every e-2W in Pakistan is a motor cycle in law.**
⚠️ **CORRECTS the vendor-site claim** that <250W needs no registration — **no basis in the Ordinance**;
it is Indian rules restated. 🔴 **The sub-97k tier cannot be unlocked by regulatory arbitrage** —
it needs primary legislation amended in four provinces.
🟢 **Balochistan publishes the missing mechanism:** EV fees are charged in the ordinary band *"after
conversion of power of electric motor from Kilo Watts (KWs) equivalent to engine capacity (cc)"*
— **but the ratio is NOT published**, and it decides 1% vs 2% of value.
🔴 **Sindh is the outlier:** Balochistan waives MV tax to 2030, Punjab 95%, KPK (4-wheelers) to 2028
— **Sindh publishes NO EV concession, only a Rs 5,000 late-registration penalty naming "EV Scooters"**
(which independently corroborates that registration is compulsory). **Karachi is in the one province
offering EVs nothing.** Keep it in proportion: ~PKR 300–600k across 200 machines. **The signal, not the sum.**

### 🟢 FREIGHT — 20ft Shenzhen→Karachi **US$1,800–2,200**, transit **9–10 days**
⚠️ **Transit contradicts the suppliers' 25–35 days** — both true: theirs is door-to-door, this is
port-to-port. **Do not net them.** 🔴 **Units-per-container is a GUESS** (~50 @ 0.6m³ → PKR
10–12.2k/unit); no supplier has given crated volume or gross weight, and a container can weigh out
before it cubes out. 🔴 **Lithium is DG — US$1,800–2,200 is a general-cargo rate and understates it.**
**CIF ≈ PKR 121,000–123,200/unit.** The gap to retail is decided by **EDB certification, not kit price.**

---

## 27-Aug-2026 ~19:57 — 🔴 FIVE RFQs SENT. The desk-research caveat is now partly void.

🔴 **SENT FROM `sheheryar.asif2@gmail.com`, NOT `sheheryar.asif@gmail.com`.** The Gmail connector is authenticated to the **.asif2** account; I reported the wrong address because I read its mailbox counts without ever checking WHICH account it was.
⚠️ **ALWAYS verify the connector's identity before telling the user an email 'was sent from X'** — `get_message` returns a `sender` field; the label counts do not.
🔎 **Tell the accounts apart by size:** `.asif2` = 998 inbox / 4 drafts. `.asif` = 8,872 inbox / 1,695 sent / 119 drafts.
**Replies will arrive in `.asif2`.** Sent on explicit instruction after a drafts review. Register + full text: `02-supply/rfq-and-supplier-contacts.md`.

| Supplier | To | msg id |
|---|---|---|
| Wuxi Keyway EV (cheapest kit, K037) | liqingxia@keywayev.com | `1a043b9823d5e1f4` |
| Wuxi SAIGE (top-6, 80k units/mo) | Info@saigebikes.com | `1a043b991edf4e95` |
| BENLG (India base; the "Benling" question) | sales@ + cc director@benlg.com | `1a043b99c72ba30d` |
| Koyosonic (cheap battery) | export@koyosonic.com | `1a043b9b92e8e2fd` |
| Hunan CTS (dear battery) | emily@ctsbattery.com | `1a043b9c7a2504de` |

✅ **Verified independently of the send call:** SENT **14→19 (+5 exactly)**, DRAFT stayed **4**
(pre-existing drafts untouched). **Never trust a send tool's own success return — count the label.**

🔴 **UPDATE EVERY FILE'S STANDING CAVEAT.** "No supplier, bank, platform or regulator contacted" is
**now false for suppliers**. Still true for banks (K4), delivery platforms, EDB/IOCO/PSQCA/Sindh Excise.

🔴 **Alibaba / Made-in-China RFQ forms need a logged-in ACCOUNT — I do not create accounts.**
Direct email to company-published addresses is the only route. Contacts came from each firm's OWN
site, not a platform inbox. ⚠️ `keywayev.com` times out on WebFetch but resolves via curl —
its contact page gives **liqingxia@**, while search results reported **wulingli@**. Used the
contact page.

**Framing kept honest (N3):** the text states this is an evaluation, not a repeat order, and claims
no company, volume or premises. **Inflating a track record would poison the quote and the relationship.**

**Watch for, in order:** (1) who honours a warranty claim from Pakistan — K5, the weakest point;
(2) crated dims + gross weight — freight/unit is currently a GUESS; (3) whether either battery firm
quotes **cells only** → Route B goes live (0%, no EDB); (4) whether the 2× battery spread survives a
real quote; (5) whether BENLG already has a PK distributor; (6) LC vs T/T-in-advance — K4.
⚠️ **A non-reply is data too** — it answers K3.

---

## 28-Aug-2026 — the state's demand programme, the swap layer costed, and three corrections

**New files:** `03-pakistan/state-demand-and-financing.md` ·
`03-pakistan/swapping-and-the-punjab-concentration.md` ·
`05-numbers/operating-costs-and-the-competitor.md`.
**New deliverable:** `ev-atlas.html` created 09:11 — see the deliverables note at the end of this file.

### 🔴 THE STATE IS MANUFACTURING DEMAND AT 5× NATIONAL PRODUCTION
E-2W production **7,377 (FY2021-22) → 22,404 (FY2024-25), +200%** (EDB's own data). Against that,
**PAVE** (*Pakistan Accelerated Vehicle Electrification*, launched 23-Feb-2026) is subsidising
**116,000 e-motorcycles this fiscal year** — **PKR 100bn over five years, PKR 9bn this FY**.
Eligibility **18–65, nationwide including Sindh**. ⚠️ **This 5.2× framing was itself corrected on
30-Aug — see below. Read the two entries together.**

**The provincial layer sits on top:** **CM Punjab e-Bike** — 100,000 units phase 1, **students only,
Punjab only**, PKR 70,000 subsidy, **interest-free PKR 2,100/month via Bank of Punjab**, male
students PKR 14,000 down, **female students PKR 0**, deadline 15-Sep-2026. 🔴 **That is the price
floor any commercial offer competes against** — though it is a different customer from a rider.

### 🔴 THE EDB TENDER — a 500-unit batch structure, and the window shut
**PPRA TS0000007069E**, EDB: *"Fast Track Adoption – 100,000 E-Bikes"*, structured as
🔴 **200 batches of 500 units**, 90-day fast-track, EOIs from all EV 2W OEMs/assemblers, awarded on
*"available production capacity and **CKD inventory**"*. **Deadline June 2026 — already closed.**
🟢 **The batch size is the finding:** 500 units is **2.5× the 200-machine fleet modelled** and
**10× the 50-unit supplier MOQ** — an order exactly the scale a small entrant could serve.
🔴 **Whether further batches or a second EOI round follow is the highest-value question to put to
EDB — and it is a phone call, not a research task.** It reframes `01-question/edb-call-script.md`:
the call is now about **whether there is a procurement pipeline to sell into**, not only about
certification.

### 🔴 CORRECTION — Bykea already has an EV partner. This research said it did not.
**ELFA Electric has been partnered with Bykea since July 2025**, announced in Karachi, after a
**six-month pilot** with driver-partners. Model **ELFA EV-125** — **already in this project's
catalogue at PKR 345,000**. Rider offer: *"special installment plans"*, claimed saving **up to
PKR 8,000/month**, fuel cost cut up to 70%. 🔴 **No rider count, bike count or target disclosed.**

🟢 **But it validates the fleet arithmetic precisely.** `fleet-model.md` modelled the operator
collecting **PKR 300–450/day (7,800–11,700/month)** out of **PKR 16,105/month** of headroom.
**16,105 − 8,000 ≈ 8,100 to the financier** — landing on the modelled **PKR 300–350/day** band.
**An independent commercial offer, built by people with real riders, prices at the number this
model derived from first principles.**

### 🔴 EVERYTHING IS HAPPENING IN PUNJAB
CM e-Bike scheme · **foodpanda + Wasl** EV rider fleet (Lahore) · **Zyp** BaaS network (Lahore) ·
ezBike/ezSwap (Islamabad/Rawalpindi) · first public swap station (Faisalabad) · **Mitigation Action
Facility EUR 8.9m** (Faisalabad, Lahore, Multan) · tax concessions in Balochistan/Punjab/KPK.
🔴 **The one Karachi-anchored initiative found is ELFA + Bykea.** ⚠️ **This framing was corrected
on 29-Aug — Sindh's programme is real, it is just public-transport-led. See below.**

**foodpanda + Wasl Investment Finance (SECP-regulated NBFC), Lahore:** riders access EV financing
through Wasl, which provides *"cash flow based financing … structured in ways to avoid the need for
any form of hard collateral"*. 🟢 **`fleet-model.md` argued the answer to rider affordability is a
platform-plus-financier arrangement collecting against earnings. A platform and an NBFC have
independently built exactly that.** 🔴 **And it removes first-mover advantage in Punjab** — the
platform relationship, the scarcest asset in the plan, is taken there by the largest player with
government backing. ⚠️ Unestablished: financing-to-own vs rental, whether it reaches Karachi, and
scale — no unit count disclosed.

### 🔴 ZYP — the closest analogue that exists, measured against its own plan
US$1.2m seed (2023) + **US$1.5m Pre-A led by Shorooq Partners**. Own factory, **12,000 bikes/year**.
**Announced July 2024: 60+ swap stations and 1,000 ZUM 2000 motorcycles in 12 months.**
**Zyp's own locations page, read 28-Aug-2026 — 25 months later — lists 10 sites, all Lahore, two of
them Zyp's own premises. Eight third-party hosts against a 60-station plan: ~17%, at 25 months not
12.** 🔴 **Any plan here that assumes a network can be stood up quickly should be re-read against
that.** 🟢 **The host pattern is the copyable part:** TCS depots, Chughtai Lab clinics, METRO, Apni
Dukaan — **cabinets inside other companies' existing footprints, not built sites.**
⚠️ 60 cabinets at ~US$3,800 is ~US$228,000, so **funding was probably not the limit** — siting,
permissions, grid connections and demand density are the likelier constraints. `[VERIFY with Zyp]`

### 🟢 SWAP CABINET CAPEX — the first hard number
**Guangzhou Tycorun**, published tiers: **US$3,999 (5–49) / 3,799 (50–99) / 3,599 (100+)** →
**PKR 1.00–1.11m each** at 277.90. TYCORUN 8-slot Alibaba sample **US$4,999**. Spec: 48/60/72 V,
50Ah, **1760 × 550 × 710 mm, 160 kg**, >1,000 cycles, FOB Shenzhen.
🟢 **It accepts L/C** — *"L/C, T/T, D/P …"* — a real datapoint for **K4**.
⚠️ *"Batteries included"* is ambiguous; a quote must state **how many packs at what Ah are in the
box**. ⚠️ A secondary source puts smart 10-slot cabinets at **US$1,400–2,000** — less than half;
the spread is unexplained and the product page is the better evidence.
**So one swap point is ~PKR 1.0–1.4m in hardware**, before circulating packs, installation and the
electricity connection — **and the connection is where the cost and delay usually sit.**
🟢 **Recall it lands duty-free:** 8504.4030, 0%, condition **Nil**.

### 🟢 MITIGATION ACTION FACILITY — a financing structure worth understanding
**EUR 8.9m: EUR 3m demonstration grants + EUR 3m first-loss guarantees leveraging EUR 18.6m of
commercial lending — 6.2×.** Implementer **LUMS**; lenders **HBL and Meezan**. Targets **9,614
swappable e-3W, 137 swap stations, 12.3 MWp solar**, in Faisalabad/Lahore/Multan; implementation
**08/2026–07/2031**. 🟢 **It names two banks willing to fund EV assets against a guarantee — a
route to K4 this research had not considered.** ⚠️ **Three-wheelers, Punjab only.**

### 🔴 RESIDUAL VALUE — the fleet model's exit, and it is weak
Used e-bikes on PakWheels **PKR 19,000–80,000+**; **15–25%/year** depreciation, most in year one;
**50–60% retained at three years**; the market *"still evolving … depreciation can be high due to
concerns about battery life."* 🔴 `fleet-model.md` locks capital **13–20 months per machine** and
assumes recovery — **if the exit is thin the asset is effectively consumed.**
🟢 **This is the strongest argument yet for owning the battery rather than selling it with the
machine:** if the operator retains the component buyers distrust, the vehicle's residual stops being
battery-dependent and the pack keeps earning. Same logic Yadea follows at 28.4% of revenue.
⚠️ **Generic industry figures, not Pakistani data.** No Pakistani residual series exists.
⚠️ **Superseded in part on 01-Sep** — Dawn puts the loss at ~50% *at the showroom door*. See below.

### 🔴 ELFA IS A WAVETEC COMPANY — re-read the competitive picture
**ELFA Electric is a product of EV Technologies, a subsidiary of Wavetec** — *"operated globally for
over 37 years"*, 30-year R&D legacy. **Not one more assembler from the catalogue.**
🔴 **So Karachi delivery is held by a 37-year multinational's subsidiary, and the swap-network model
by a funded manufacturer in Lahore. Neither is a weak incumbent.** ⚠️ **But neither has been
measured** — no rider, unit or capacity figure published for ELFA; Zyp visibly at ~17% of its plan.
**Weak execution is not a weak competitor.**

### 🟢 KARACHI ELECTRICITY MAY BE CHEAPER THAN MODELLED
K-Electric published base: **commercial 18.50–28.50**, **industrial B1 26.23** (cut from 30.80,
**effective Feb 2026 → Dec 2026**), B2 26.16, B3 27.00 — all **below the 39.70 the TCO assumed**.
🔴 **Do not drop these into the model.** The bill adds **FCA, QTA, GST and meter rent**, and
commercial tariffs carry **fixed charges on sanctioned load** — which matter for a swap cabinet that
draws in bursts. **The base rate is not the effective rate.** ⚠️ The industrial cut expires
end-December 2026.
**Connection:** application → site survey → **demand note (where the charge appears)** → meter in
**15–20 days**. 🔴 **The connection charge is not published — quoted per site after survey.** So the
cost identified as the real constraint behind a swap point **cannot be researched, only requested.**

### ⚠️ INSURANCE — a fleet operating cost that was never in the model
Third-party (legally required) **PKR 2,500–4,000/yr** for a 70cc; comprehensive **PKR 5,000–20,000+**.
**Karachi is explicitly rated higher-risk.** At a mid-range PKR 12,000, **a 200-machine fleet carries
~PKR 2.4m a year against a PKR 50m base — not fatal, but entirely absent from the model**, and for a
rental operator comprehensive cover is not optional.
🔴 **And the cc problem appears a third time.** Registration fees, provincial token tax **and now
insurance premiums are all cc-banded** — while an electric motorcycle has no engine capacity.
**No insurer's approach to rating a zero-cc vehicle was found, and no EV-specific motorcycle
insurance product exists in Pakistan at all.** Whether comprehensive cover is written on a lithium
vehicle at standard rates is **unestablished and a real exposure for a rental fleet.** Broker question.

---

## 28-Aug-2026 (evening) — Parliament wants lead-acid shut down, and there is no regulator to do it

**New file:** `03-pakistan/regulatory-vacuum-and-the-battery-crackdown.md`. Source: **National
Assembly Standing Committee on Industries and Production**, July 2026, consistent across five
outlets. ⚠️ **Press reporting of a committee, not its own minutes.**

> **"The companies using lead-acid batteries in electric motorcycles should be shut down."**
> — **Naz Baloch**, committee member. Reasons: substandard quality, **explosion risk in hot weather.**

🟢 **This validates the most load-bearing judgement in the project.** `battery-layer.md` found
lead-acid dies in **8–13 months at fleet duty cycles in Pakistani heat**;
`fifth-schedule-primary-text.md` found the tariff **excludes lead-acid by name** and taxes it at
**double**. **Parliament arrived at the same place, for the same reason — heat. Policy, tariff and
engineering now all point one way.** ⚠️ No deadline, no company named, no count of affected licensees.

### 🔴 But the machinery to enforce anything does not exist
| Gap | Committee's own record |
|---|---|
| **No regulator** | **No dedicated authority for e-motorcycles.** EDB (licences) · PSQCA (standards) · NEECA (charging) · provincial (roads). Chair Dr Mehreen Bhutto: *"Too many ministries and departments were involved."* |
| **No battery policy** | None exists; EDB CEO said one was *"being finalised."* |
| 🔴 **Licences don't require lithium** | **EDB licences do not mandate lithium-ion** — licensees may fit lead-acid and stay compliant |
| **No testing labs** | PSQCA holds **172 standards for electric motorcycles** but **no lithium battery testing laboratories**, and *"no effective mechanism to ensure implementation"* |
| **No complaint channel** | A manufacturer asked where to report illegal battery makers. **The question went unanswered.** |

🔴 **So the PSQCA release certificate on the battery tariff line is a paper gate with no laboratory
behind it.** It cuts both ways: **easier to clear than feared, and worth less than it appears** as a
barrier to competitors.

### 🔴 The grey market — and it lands on Route B
> *"Unlicensed operators import lithium-ion cells **as scrap** and resell them without registration
> or quality control."*

**First evidence of an informal-sector competitor, attacking the component that is 53% of FOB cost.**
It does not kill Route B — a fleet operator selling uptime is far less exposed than a battery
retailer — but **any plan to sell packs into the aftermarket now has a named competitor with a
structural cost advantage.** ⚠️ The committee heard substandard batteries have **2–3 year lifespans
and cost PKR 90,000 to replace** — consistent with this project's own PKR 115,000 retail finding,
from an independent source.

### Separately: BYD is building near Karachi
**BYD + Mega Motor Company (a Hub Power subsidiary)**, near Karachi, under construction since
**April 2025**, first Pakistan-assembled car **July/August 2026**, **25,000 vehicles/year**.
⚠️ **Cars, not two-wheelers.** But 🔴 **the largest Chinese EV manufacturer chose Karachi, in the
province with no EV concessions — which weakens the "everyone went to Punjab because Sindh offers
nothing" reading.** **Huaihai** is confirmed to operate in Pakistan, India, Peru, Chile, Indonesia —
🔴 **but no JV, plant or partner in Pakistan could be identified.** `[PLACEHOLDER]`

---

## 29-Aug-2026 — warranty quantified, Sindh corrected, three charging tariffs, and a customs floor

**New files:** `02-supply/warranty-gap-and-coming-standards.md` ·
`03-pakistan/sindh-correction-and-psqca.md` · `05-numbers/charging-tariff-and-the-grey-market.md` ·
`05-numbers/customs-valuation-floor.md` · `03-pakistan/pave-supply-answered.md`.
**Source archived:** `06-sources/customs-valuation-ruling-1964-2025-lithium.pdf`.

### 🔴 K5 IS NOW A NUMBER
| Who | Battery warranty |
|---|---|
| **Okla** OKG | **5 years** |
| **ELFA** — the Bykea partner | 🔴 **3 years / 50,000 km**, marketed *"industry-leading"* |
| **Yadea** via Road Prince | 24 months / 20,000 km |
| **Aima** (China domestic) | 3 years on lithium |
| 🔴 **Koyosonic** — the favourable-priced pack | **1 year below 50Ah** — *exactly the two-wheeler pack size* |
| Hunan CTS | Not published |

**Pakistani competitors warrant 2–5 years. The reachable Chinese supplier warrants 1 year on the
relevant size.** 🔴 **An importer at Koyosonic's price cannot match ELFA's 3-year/50,000 km without
self-insuring two years of battery liability** on a PKR 59,281–115,000 component. **On 200 machines,
a 15% failure rate between years 1 and 3 at ~PKR 60,000 is PKR 1.8m unfunded** — ⚠️ **and 15% is a
guess; no failure-rate data exists.**
🟢 **A rental/BaaS operator warrants nothing to a rider — it keeps the fleet running. The exposure
becomes a forecastable operating cost instead of a contingent liability. This is now the strongest
structural argument for rental over sale.**
⚠️ **And note what "warranty" means at this tier:** Yadea earns **28.4% of revenue** from batteries
and chargers and sells more batteries than vehicles. **The industry monetises replacement rather
than absorbing it — a generous warranty from a Chinese ODM is a marketing number until someone
tests who honours a claim from Karachi.**

### 🔴 THE BATTERY POLICY IS LATER AND WIDER THAN REPORTED
It is now the **Next Generation Energy Storage Policy (2026–2033)** — EDB Chief Executive
**Hammad Mansoor** expected to present an upgraded version *"shortly."* **Still in development,
scope widened from EV batteries to energy storage generally, horizon to 2033. Still the single most
consequential pending document for this decision, and later than the July reporting implied.**

**Proposed PSQCA standards, and they are demanding:** packs must survive a **one-metre drop onto
bare concrete** with no cracks, leaks or internal damage; **ingress protection explicitly including
flooding and monsoon conditions**; EDB + NEECA directed to build an inspection and verification
mechanism.
🟢 **Actionable now, not later: ask every supplier whether the pack passes a 1 m drop onto concrete,
and its IP rating against immersion.** The RFQs already asked for IP rating — that was the right
question. ⚠️ **Karachi floods. A pack rated for dust but not immersion is the wrong pack for this
city** — an engineering judgement that does not need to wait for a policy.

**Road Prince / Yadea:** partner **Eiffel Industries Limited**, **~US$10m** infused incrementally
into an existing plant at **Kasur (Punjab)**, six models announced PKR 150,000–1,000,000, **3S
dealerships (Sales, Service, Spare Parts) across Pakistan**.
🔴 **Note what the US$10m buys: service and spare parts — precisely the variable
`india-fame-shakeout.md` identified as decisive, and the one that destroyed Ola from 50% share. The
world's largest e-2W manufacturer, entering Pakistan, is spending its money on the thing this
research says decides the outcome.**
⚠️ Its quoted Pakistani range PKR 204,000–350,000 conflicts with the catalogue's PKR 174,000–1,400,000
— **different source, different date, possibly a different model set. Do not merge them; the
PakWheels catalogue is the better evidence for what is actually on sale.**

### 🔴 CORRECTION — "Sindh offers none of that" was too strong
**Sindh Budget 2026-27 allocates PKR 39.5bn to transport and communications.** Reviewed at a
Transport & Mass Transit Department meeting chaired by **Sharjeel Inam Memon, 4-Aug-2026**:
**EV taxi service launching September 2026 · 1,000 electric buses in phases (500 already approved) ·
50 double-deckers to Karachi October 2026 · 🔴 pink EV scooters for women — a two-wheeler
programme · charging infrastructure explicitly funded.** Sindh was **the first province to introduce
electric buses in Pakistan.**

**The corrected picture: Sindh's EV strategy is public-transport- and fleet-led; Punjab's is
consumer-subsidy-led. Different strategies, not presence versus absence.**
🟢 **This improves the Karachi case rather than weakening it** — a province funding EV taxis, e-buses,
women's e-scooters and charging is building demand and grid capability in the target city.
⚠️ **The original point survives in narrower form:** an entrant selling to private buyers or riders
in Karachi still gets **no provincial subsidy and no tax concession**; the same entrant in Lahore
would. **The consumer-facing gap is real. The "nothing is happening" framing was not.**
🔴 **"Pink EV scooters for women" is a direct government two-wheeler procurement in Sindh** — the
Sindh analogue of the EDB 500-unit batch. **Whether it is tendered, and to whom, is worth asking.**

### 🔴 THERE IS NO SINGLE EV CHARGING RATE — THERE ARE THREE
| Rate | PKR/kWh | What it is |
|---|---:|---|
| Residential off-peak | **23.57** | NEPRA subsidised off-peak domestic |
| NEV Policy commercial fast-charging **cap** | **39.70** | 🔴 **the figure this project modelled** |
| **NEPRA EVCS, base + adjustments** | **48.78** | what a public charging station actually carries |

🔴 **For a public charging business the TCO's electricity assumption was optimistic, not
conservative — 48.78 against 39.70.** 🟢 **For a fleet it is lower, not higher:** a depot charging
overnight is not a public charging station; it buys at a commercial/industrial connection
(**18.50–28.50**) or residential off-peak (**23.57**), both well below 39.70. 🟢 EV charging stations
are reported **exempt from certain fuel cost adjustments** that hit other consumer categories —
⚠️ **whether a private fleet depot qualifies as EVCS is exactly the question, and it is unverified.**
**Net: at the worst number found (48.78) the electric bike still runs at ≈1.22 PKR/km against
petrol's 5.72–6.24 — roughly a fifth. The conclusion does not turn on which applies; only the margin
does.** ⚠️ **All three are press/aggregator grade, not read from a NEPRA notification. Get the EVCS
tariff determination before relying on any of it.**

🟢 **And the grey market inverts on a second reading.** It exists because finished lithium packs
carry **CD 10% + RD 2%** and lead-acid **20–24%** — **but Route B imports CELLS at 0%** (Fifth
Schedule Part-III sr.143). **So a legitimate Route B operator faces the same zero duty the scrap
importer evades, and beats them on cell quality, BMS, testing and warranty. The grey market's entire
cost advantage is duty avoidance on a duty that Route B does not pay.**
⚠️ Two things stop it being a clean win: the scrap operator also avoids PSQCA, testing and any
warranty obligation — **and PSQCA has no lithium testing laboratory, so nothing forces the
comparison at point of sale** — and **the customer cannot tell the difference at purchase.** That is
a marketing problem, not a cost problem, **and it is precisely the problem a rental/BaaS model does
not have**, because the operator keeps the pack and bears the failure directly.
🟢 **Third time this session the same conclusion arrived from a different direction** — warranty
exposure, residual value, and now grey-market quality signalling all argue for **owning the battery
and renting the service** rather than selling the machine.

🔴 **And one line that changes how EDB certification reads:** *"EDB licences did not specifically
require lithium-ion, allowing some companies to use cheaper lead-acid dry batteries."*
**So an EDB licence certifies the assembler, not the chemistry** — and the PAVE approved-model list,
which routes through EDB approval, **may therefore include lead-acid machines. That materially
weakens the assumption that PAVE approval implies a quality floor.** `[VERIFY]`

### 🔴 THE CUSTOMS VALUATION FLOOR — a hole in the landed-cost model nobody had looked for
**Valuation Ruling 1964/2025**, Directorate General of Customs Valuation, Custom House Karachi,
**29-01-2025**, under **s.25A Customs Act 1969**. *Determination of Customs Value of Lithium Ion
Battery, PCT 8507.6000, all origins.* **Duty rates were known; the value the duty is charged on was
assumed to be the invoice. It is not necessarily the invoice.**

| Band | WeBOC PCT | $/kg | $/kW | Basis |
|---|---|---:|---:|---|
| **IP-20** | 8507.6000.1000 | **7** | **70** | 🔴 **whichever is higher** |
| **IP-21** | 8507.6000.1100 | 8 | 80 | whichever is higher |
| **IP-65** | 8507.6000.1200 | **9** | **90** | whichever is higher |

Values are **C&F USD**. **Para 7 makes it a FLOOR, not a fixed price** — a higher declared value is
assessed at the higher value. The **air-vs-sea freight difference is added**. Phone, laptop and
tablet batteries are excluded. Applies until rescinded; s.25D revision within 30 days.
🔴 **The band is set by IP RATING**, and IP-65 (weatherproof) carries the highest values.

**Applied to this project's own candidates — it bites on two of three at IP-65:**

| Supplier | IP-65 floor | Invoice | Bites? |
|---|---:|---:|---|
| **Koyosonic** 72V 35Ah (15 kg, 2.52 kWh) | **$226.80** | $213.32 | 🔴 **Yes — +6.3%** (PKR 63,027 vs 59,281) |
| **Dongguan Rishengzhi** 72V 30Ah (16 kg, 1.89 kWh) | **$169.92** | $151.20 | 🔴 **Yes — +12.4%** |
| **Hunan CTS** 72V 30Ah (18 kg, 2.16 kWh) | $194.40 | $410.00 | 🟢 No — invoice far above |

🔴 **For a Karachi fleet the pack must be weatherproof, and weatherproof is the top band. The coming
PSQCA standard requires resistance to flooding and monsoon conditions, and Karachi floods annually
— so IP-65 is not an upgrade, it is the specification, and it puts both cheap packs below their own
customs floor.**
🟢 Absolute impact on duty is modest (1% on the EV-CKD route, 0% on Route B) — **but sales tax at
18% and withholding at 11–12% are charged on the assessed value**, so the uplift flows straight into
those (~PKR 1,100 per Koyosonic pack in extra tax base effect).
⚠️ **It also partly erodes the Koyosonic advantage this research leaned on: the cheaper the declared
price, the more the floor closes the gap. A quote below the floor buys nothing at the border.**
⚠️ **The ruling writes "KW"; for a battery this is almost certainly kWh. The ambiguity is the
ruling's, not ours — clearing-agent question**, and it changes the per-kW column by orders of
magnitude.
🟢 **The ruling's own background is under-invoicing** — *"massive under-invoicing … declared values
did not correspond to market prices"*, over 90 days of import data, with transaction value under
s.25(1) found inapplicable. **That is the state attacking the exact economics that make the
scrap-cell trade viable, and it strengthens the Route B case: the floor removes the
under-declaration advantage regardless of duty rate.**
🔴 **A trade-press summary said values are *"per kilowatt (KW), not per kg"* — WRONG.** The PDF read
directly shows **both columns** under *"whichever is higher"*; the aggregator dropped the per-kg
column, **which is the binding one for a heavy, low-energy pack.** **Third time in this project that
going to the primary document changed the answer** (after the "10–15%" duty rate and the concession
expiry date).
🔴 **`Valuation Ruling 2061/2026` covers lithium-ion CELLS (LFP, LiFePO4, prismatic) — the item
Route B actually imports — and its values were NOT obtained.** Existence and scope confirmed
(*"significant discrepancies between declared transaction values and prevailing market prices"*),
**but no figures; not publicly indexed anywhere found.** **It is a required document, not an
optional one. Request it from DG Customs Valuation Karachi or a clearing agent.** `[PLACEHOLDER]`

### 🔴 CORRECTION — the PAVE subsidy is TWO-TIER, and only the higher number was reported
| Vehicle | **Financed** | **Self-finance** |
|---|---:|---:|
| **E-bike** | **PKR 50,000** | **PKR 80,000** |
| E-rickshaw / loader | PKR 200,000 | PKR 400,000 |

🔴 **PKR 80,000 is the SELF-FINANCE tier. A buyer taking instalments gets PKR 50,000 — 37.5% less
than every file in this workspace and the published artifact were reporting.**
⚠️ **The subsidised-payback scenario must be re-run at PKR 50,000 for anyone financing — which is
most of the target market, since the whole premise is that riders cannot pay upfront. The 80,000
case applies to cash buyers.** The earlier NEV Policy figure of 65,000 sits *between* the two tiers,
so it was neither right nor simply superseded.

### 🟢 THE PAVE SUPPLY QUESTION IS ANSWERED — and it is a wall, not a door
After four rounds of searching, the official portal (pave.gov.pk) states it plainly:
**"Only models approved by the Engineering Development Board (EDB) will be offered"** — vehicles
*"shortlisted based on safety, performance, and compliance standards."*
🔴 **PAVE is not an import channel. It is a demand channel routed through EDB-licensed
manufacturers** — the same 34 companies that produced 22,404 units between them.
🟢 **For an EDB-certified assembler, PAVE is a state-funded order book.** 116,000 subsidised units
against a national production of 22,404 means **the licensees are the bottleneck, not the demand.
This is the strongest argument yet for pursuing EDB certification rather than importing CBUs.**
🔴 **For anyone without certification, PAVE is a wall.** The subsidy makes approved models cheaper
than anything an uncertified importer can land. **It converts EDB certification from a duty-rate
question into a market-access question.**
**Programme parameters:** 116,000 e-bikes · **3,170 e-rickshaws/loaders — so 97.3% of units are
two-wheelers**, and earlier framing that treated bikes and rickshaws as comparable legs was wrong ·
eligibility 18–65 (21–65 rickshaw) · **25% of the e-bike quota reserved for women** · includes
Gilgit-Baltistan and AJK · registrations opened **1-Sep-2025**.
**Approved models named** ⚠️ *(secondary aggregator — the official portal names none)*:
🟢 **Crown Benling Fairy — resolves the Crown contradiction: Crown IS doing electric, under the
Benling brand, and it is PAVE-approved** · **Eiffel Yadea Velax** (Eiffel = Road Prince) ·
**Nova Mobility Ecodost ED70** (EcoDost's parent, not previously known) · **Zong Fa ZF125E3000**
(previously "data incomplete") · Vitality EV Retro · E Turbo Warrior 200KM.
⚠️ **Press-grade until checked against EDB. Ask EDB for the official list — it doubles as the
competitive register.**

### 🔴 PAKISTAN ALREADY IMPORTS LITHIUM AT GWh SCALE, ON ROUTE B'S EXACT HS CODE
HS **8507.6000** monthly imports: **42 MWh (Jan 2024) → 652 MWh (April 2026), a record, +1,640%.**
Battery-storage imports 2025 **4.6 GWh (+220% YoY)**; cumulative to end-2025 **7.6 GWh**; current
annualised **~5.86 GWh**; projected 2030 **8.7 GWh**.
⚠️ **Most of this is SOLAR STORAGE, not EV — BESS imports driven by Pakistan's solar boom. Do not
read 652 MWh as EV battery demand.**
🟢 **Two things it does establish.** (1) **The import channel already exists at scale on the same
tariff line** — supplier relationships, freight routes, DG handling and customs precedent for
lithium at GWh volume are in place; **the valuation ruling exists precisely because that volume is
large. This is not an untrodden path.** (2) 🔴 **116,000 e-bikes at ~2.5 kWh is roughly 290 MWh —
about 5% of Pakistan's annualised lithium imports. The state's flagship EV scheme is a rounding
error beside the solar-storage market.** Anyone modelling battery supply security should watch
**solar** demand, not EV demand — it sets the price and the queue.

**Catalogue now 170 records** (Pakistan 111 — 91 current + 20 discontinued — across 15 brands).
Added: **E Turbo Warrior 200KM PKR 790,000** (3000 W nominal / **5400 W peak** QS BLDC hub, 95 km/h,
**200 km**, PAVE-approved) · **Vitality Retro 225,000** (PAVE-approved) · **Vitality Velocity
249,000**. 🟢 **Both PAVE-approved names from the aggregator list are now confirmed as real, priced
models on PakWheels — which raises confidence in the rest of that list**, though it stays
aggregator-sourced.

### ⚠️ FLEET TAM — recorded, and deliberately not substituted
Pakistan's **platform-economy workers ~1.5m**; **"location-based" (delivery + ride-hailing) ~0.5m**;
**Bykea 500,000+ bikes registered** ⚠️ *2020 figure*. Named platforms: foodpanda, Bykea, Careem,
Uber, Cheetay, Daraz, Gharpar.
🔴 **Do not swap 50,000 for 500,000.** The 0.5m includes car ride-hailing drivers, who are not
addressable by a two-wheeler fleet, and a platform registration count six years stale is not a
working fleet. **50,000+ remains the only figure tied to active delivery riders on named platforms.**
🟢 It moves the margin, not the conclusion: a 200-machine fleet needs **0.04%** of the location-based
workforce. 🔴 **The gate was never rider count — it is which platform will partner, and both
foodpanda and Bykea already have EV partners. A large TAM behind a closed door is not an
opportunity.**

---

## 30–31-Aug-2026 — the market-size correction, a same-day self-correction, and Vietnam

**New file:** `03-pakistan/market-size-corrected.md`.

### 🔴 CORRECTION — "5.2× national production" is true but misleading
`state-demand-and-financing.md` and the published artifact both led with *"the government is
subsidising 116,000 machines in a year in which the entire country produced 22,404."*
**Every number in that sentence is accurate. The framing is not** — it compares a subsidy target
against **production** and invites the reader to conclude the programme dwarfs the market.
**It does not: Pakistan's e-2W market is already about the size of the programme.**
⚠️ **And the EDB 22,404 is explicitly a NINE-MONTH figure (Jul–Mar).** Total motorcycle sales
**1.93 million in FY26** (Arif Habib Limited — a record, against 1.85m in FY21).

### 🔴 SELF-CORRECTION, SAME DAY — and it was this project's own repeat error
The file first hypothesised that a ~90,000-unit gap between "sales" (112,000) and production
(22,404) meant **roughly four in five e-2W sold here are not made here** — flagged as unverified.
**Further searching shows the ~112,000 figure is itself PRODUCTION:** *"total **production** of
electric scooters and electric motorcycles reached **111,844 units** between January and December
2025"* (Mobile World Magazine).
**So there is no 90,000-unit import gap. Both figures are production, from different collectors,
over different periods, and they reconcile by growth** (+191.7% YTD April, +173% H1 2026, electric
+50% in Q1 2026) **— not by imports.**
🔴 **The lesson is the one this project keeps relearning: do not difference figures across sources.**
It is the same error as the withdrawn 8–9% penetration figure. **Flagging the risk in the same
breath as making it is not the same as not making it.**
⚠️ **The CBU-import share remains genuinely unknown. It is simply not 80%, and no number should have
been implied. The honest position is the one this project started with: no reliable import/local
split exists.**

### What the new data does establish
🔴 **64 companies / ~70 brands** operating in Pakistani e-2W · **electric scooters ~94% of output**
(motorcycles are the small remainder) · Q1 2026 total two-wheeler market **+33% YoY to 530,000+
units**, electric segment **+50%** · YTD April EV sales **+191.7%**, with *"almost all dealers in
short supply."*
🟢 **That last line is the most commercially interesting finding of the day. A market growing
173–191% with dealers unable to get stock is supply-constrained — exactly the condition in which a
new importer or assembler can enter without displacing anyone.**
🔴 **64/~70 against 34 EDB licensees means roughly half the market's companies operate without a
manufacturing licence** — consistent with the grey-market and regulator-gap findings.
🔴 **And it exposes a coverage limit in this project's own catalogue:** `MASTER-model-price-list.md`
covers **15 Pakistani brands**; if there are ~70, **it captures perhaps a fifth of the brands** —
though likely most of the *volume*, since the named brands are the ones with dealer networks and
PakWheels listings. **Describe it as covering the documented market, not the whole market.**

**Penetration, computed properly:** 111,844 ÷ (1,930,000 + 111,844) = **~5.5%**; a third-party post
gives **4.6%**. 🟢 **A defensible range is 4.5–5.5%** — materially higher than the ~1% production
alone implies, materially lower than the withdrawn 8–9%. ⚠️ **Still a production numerator over a
sales denominator, so still not like-for-like, and it does not become citable through repetition.**

### 🔴 "5th largest e-2W market in the world" — checked against ICCT, NOT confirmed
Checked against the **International Council on Clean Transportation**, the most credible independent
source for global two-wheeler electrification. 🔴 **ICCT does not confirm it and does not list
Pakistan at all.** ICCT ranks by **sales share**, not absolute units: **China 54.8%** (from 51.7% in
2024), **Vietnam 21.7%** (from ~10%), **India 6%** (2024, described as the world's **second-largest**
e-2W market by volume). China + India + Southeast Asia ≈ **80% of global 2/3-wheeler sales**.
⚠️ **So the claim is neither confirmed nor refuted — ICCT measures a different thing, and no
independent source found ranks countries by absolute e-2W volume.**
🔴 **The claim stays single-sourced and unverified. Do not put it in front of an investor.**

🟢 **But the ICCT data calibrates Pakistan usefully, and this is the sharpest framing the project has
produced: Pakistan's 4.5–5.5% sits just below India's 6% — so Pakistan today is roughly where India
was when its shakeout began, and India reached 6% through a subsidy cycle that destroyed most of the
entrants who chased it.**

### 🟢 VIETNAM — the comparable this research never looked at
**~10% → 21.7% e-2W share in a single year** — the fastest shift in the dataset, and **four times
Pakistan's level.** 🔴 **The mechanism was not a purchase subsidy.** ICCT attributes it to **Hanoi
and Ho Chi Minh City planning low-emission zones that would ban or restrict petrol two-wheelers from
city centres.** **A subsidy pays people to switch; a restriction removes the alternative — and
Vietnam's result suggests city-level access rules move share faster than money does.**
⚠️ **There is no evidence Pakistan is considering petrol restrictions in Karachi or anywhere else,
and this research found none. A scenario to watch, not a plan to bank** — but it is the single policy
change that would most transform the demand case, and Karachi's air quality gives it a rationale.
**Open: whether any Pakistani city has discussed low-emission zones. Not searched yet; worth one look.**

---

## 01-Sep-2026 — 🔴 DAWN, 29-AUG: FIVE NAMED OPERATORS. THE BEST SOURCE IN THIS PROJECT.

**New file:** `03-pakistan/dawn-29aug-named-operators.md`. Source: **Dawn, *"Leading the charge on
two wheels"*, published 29 August 2026** — Pakistan's paper of record, three days old at reading.
🔴 **This single article answers four sections the plan flagged as open, kills one thesis this
research had carried since day one, and supplies the working-capital number that sizes the whole
decision.** It is **the first source in this project where people who actually operate in this
market are quoted by name:**

| Who | Role |
|---|---|
| **Faraz Zaidi** | Chairman, **Wasl Mobility Modaraba** — finances electric mobility |
| **Ammar Habib Khan** | CEO, **National Credit Guarantee Company Ltd** — building a 2W EV financing model |
| **Huma Yahya Khattak** | CEO, **Elfa EV Technologies** — 🟢 already in this project's catalogue |
| **Fahad Hassan** | Founder, **ChargePK** — runs the charger-location app |
| **Muntaqa Peracha** | CEO, **Foodpanda Pakistan** — ~40,000-rider delivery fleet |

⚠️ **Grade: named-executive press. Better than aggregator data, weaker than audited filings. These
are practitioners with commercial incentives, not neutral statisticians. Where their figures conflict
with a filing, the filing wins.**

### 🔴 1. THE FLEET BEACHHEAD THESIS IS EMPIRICALLY REFUTED
**Foodpanda Pakistan, from its own CEO: ~40,000 riders, ~150 electric bikes. 0.375%.**
🔴 **The largest delivery fleet in the country — whose riders have the highest mileage and therefore
the fastest payback in the entire market — is 99.6% petrol. This is the exact segment this research
identified as the beachhead, and it has not converted.**

**And Peracha gives the reason, which is not price:**
> *"In the roughly **30 minutes** it takes to charge an electric bike, a rider could be out making a
> delivery as that is approximately the time it takes to complete one order."*

🔴 **Charging a bike costs a rider the earnings from one delivery. For a piece-rate worker the
running-cost saving is collected in rupees per kilometre but paid for in lost orders — and the lost
order is immediate and certain while the saving is gradual.**

🟢 **Read the refutation precisely: it is a charging-TIME failure, not a fleet failure. The fleet
economics are not disproved; the fleet's tolerance for downtime is.** And the fix is named in the
same article — ChargePK *"is in talks with e-swap technologies… particularly important for delivery
riders, for whom a bike is not simply a means of transport but a source of income."*
🔴 **The corrected thesis: the fleet channel is not a beachhead — it is a beachhead CONDITIONAL ON
BATTERY SWAPPING.** A swap is measured in seconds; a charge costs an order. **This converts swapping
from an interesting option into the precondition for the entire B2B case**, and it aligns with
`swapping-and-the-punjab-concentration.md`. ⚠️ **No deployed delivery-fleet swap network exists in
Pakistan — "in talks" is the state of it.**
⚠️ **`01-question/research-plan.md` §L/§3 must stop treating "fleet channel as a possible beachhead"
as an open question with an assumed-favourable answer. It has been tested in the market at
40,000-rider scale and it failed on charging time.**

### 🔴 2. THE WORKING-CAPITAL NUMBER — and it is four times the budget
**Ammar Habib Khan, NCGCL:**
> *"At **1,000 units a month per OEM**, an assembler must commit around **Rs 200 million in working
> capital** before a single bike is sold."*

🔴 **Stated risk capital is PKR 50 million. That is one quarter of the working capital a
1,000-unit/month assembler needs — before margin, before a single sale.** Scaled pro-rata, PKR 50m
supports roughly **250 units/month (~3,000 units/year)** — ⚠️ **and that is the whole 50m consumed as
working capital, leaving nothing for the PKR 7.5m parts-and-training requirement under gate K8,
nothing for premises, and nothing for losses.**

**The mechanism, in his words — the classic import trap:**
> *"Electric bikes remain heavily dependent on imports from China, requiring **letters of credit and
> strong credit lines**. **Without inventory, there can be no sales; without sales, there is not
> enough cash flow to replenish inventory.**"*

🟢 **This is precisely what this project predicted — *"an import business dies of working capital,
not of margin."* Section K is no longer theoretical.**

🔴 **And a named OEM is currently failing this test.** Elfa *"is scrambling to get money to order
more material"* — its own CEO. **An established, catalogued, operating manufacturer cannot fund its
next order. That is the single most sobering line in this entire research project — not because
demand is weak, but because it is strong, and the company cannot finance the inventory to meet it.**
🔴 **So the binding constraint on entry is NOT duty rates, EDB certification, supplier selection or
product-market fit. It is the cash conversion cycle. Every one of those other questions has been
researched in depth; this one is now the largest.**
⚠️ **One named CEO, one number, PKR 200m. Get a second source before acting on it** — and establish
**whether Rs 200m assumes CKD assembly or CBU import**, because the cycle differs materially.

### 🟢 3. ELFA CONFIRMS ROUTE A — including which parts get localised
> *"Elfa imports **completely knocked-down scooters from China** and assembles them locally. It also
> **manufactures its own batteries**, while **importing other components such as motors and
> controllers**."*

🔴 **Route A exactly as this project modelled it, confirmed operating under a named CEO** — and it
reveals the localisation split a real operator chose: **battery made locally · motor imported ·
controller imported · rest of the scooter imported CKD.**
🟢 **Localising the battery first is rational on this project's own numbers** — it is the heaviest,
bulkiest, most freight-expensive item, it carries a customs valuation floor, and it is 40–45% of
cost. **Independent confirmation that the battery is where localisation value sits.**
⚠️ **It also means Elfa is exposed to the cell-import route (Route B) and therefore to Valuation
Ruling 2061/2026, which this project still does not have.**
**Open: whether Elfa imports cells or assembles packs** — it bears directly on Route B.

### 🔴 4. BATTERY = 40–45% OF THE BIKE — the plan's §B number, answered
> *"Batteries account for roughly **40pc to 45pc** of the cost of an electric bike."*

⚠️ **His illustration — Rs 100,000 on a Rs 200,000 bike — is 50%, above his own stated range. He is
speaking in round terms: use 40–45% and treat the example as rhetorical.**
🟢 **Closes the plan's Section B request** (*battery as % of vehicle BOM and of retail price*),
**from a market practitioner.**
🔴 **And it re-frames the sourcing question entirely. If the battery is 40–45% of the bike, the
supplier-price spread this research documented — Koyosonic at roughly half Hunan CTS — is not a
component-level saving. It moves ~20% of the retail price of the finished machine.**

### 🔴 5. RESALE — a 50% cliff at the showroom door
> *"A bike can **lose roughly 50pc of its value once it leaves the showroom**"* — partly because
> there is no established secondary market for EV bikes, partly because the battery loses capacity.

🟢 **This answers the plan's Section 13, and the answer is bad.**
🔴 **A 50% instant depreciation is close to fatal for financing, because a lender's security is worth
half the loan the moment the asset is delivered. It explains why two of the five named sources in
this article are financiers building bespoke models — ordinary auto finance cannot underwrite this
collateral.**
⚠️ **This supersedes the generic "50–60% retained at three years" recorded on 28-Aug.** Dawn's figure
is Pakistani, named-source and specific to the showroom-exit moment; **prefer it, and treat the
generic e-bike industry depreciation curve as not applicable to this market.**
🟢 **And it compounds with the battery: residual is weak *because* the battery degrades, and the
battery is 40–45% of the cost. Swapping severs that link** — if the rider never owns the battery,
the degrading asset is off their balance sheet and out of the resale calculation. **A second,
independent argument that swapping is structural rather than optional.**

### ⚠️ 6. A MACRO EVENT THIS RESEARCH HAD NOT ACCOUNTED FOR
**Faraz Zaidi:**
> *"**Before the US attack on Iran**, the operating cost of an EV bike was around **25 per cent** of
> that of a conventional bike, including petrol, engine oil, spark plugs and filters. **Since the
> war, it has fluctuated around 15pc**."*

🔴 **The opex advantage improved from 4× to ~6.7× because petrol got more expensive.**
🟢 **Payback on the price premium: ~1.5 years** through fuel savings — the higher the mileage, the
faster it comes.
🔴 **But read the fragility: that improvement is a war premium on oil, not a structural gain. If the
premium unwinds, the ratio reverts toward 25% and payback lengthens.**
⚠️ **Every TCO scenario in this project must therefore be run at BOTH 15% and 25%** — the same
discipline already applied to the with/without-concessions cases. **A demand case resting on a war
is not a demand case.**

### 🔴 7. CHARGING INFRASTRUCTURE — and the number is *two*
**Fahad Hassan, ChargePK: at most about **100 DC chargers** in all of Pakistan. ChargePK has **2,500
app users** — of which 🔴 **TWO are for bikes.**
🔴 **Two users. Whatever charging network exists in Pakistan, it is not being used by two-wheelers
at all.**
**And the reason is interoperability, not only scarcity:**
> *"Many DC chargers in Pakistan **do not allow bikes**, while **many bikes do not support the type
> of DC charging available**."*

🔴 **So the public DC count overstates bike-relevant capacity twice over — chargers that exclude
bikes, and bikes that cannot use the standard. The effective public DC network for a two-wheeler is
close to zero.**
🟢 **What people actually do instead:** *"Some of our customers have bought good extensions which
they **toss down from the balcony**."* Others have arrangements with **ground-floor homes or nearby
kiryana stores**; some charge **at their offices**.
🟢 **This is a real finding, not colour: charging is being solved socially rather than
infrastructurally, so home-charging access is not binary and adoption can proceed without a
network.** ⚠️ **But it also means charging quality, safety and speed are entirely uncontrolled** —
which bears directly on the fire-risk and warranty questions in
`warranty-gap-and-coming-standards.md`.

### 🔴 8. KARACHI IS THE HARDER MARKET — now with a physical mechanism
This project already documented the Punjab concentration from policy and swap-station data.
**Dawn confirms it independently and adds a cause that has nothing to do with policy:**
> *"Electric scooties generally have very **low ground clearance**, which is poorly suited to
> **Karachi's roads**. This is one reason there are more electric scooties in Lahore than in the
> port city."*

**And a second, separate Karachi problem:** *"A lack of charging infrastructure, combined with the
fact that **most of Karachi's residents live in apartments**, makes charging electric bikes a
significant challenge."*

🔴 **Two independent structural disadvantages in Karachi — road surface and housing stock — neither
of which any policy fixes, and both of which favour Lahore.**
⚠️ **This matters more than any other geographic finding in the project, because Sheheryar is in
Karachi.** The plan's §L asks which city first. **The evidence now says the home city is the worse
one**, on three layers:
1. **Ground clearance vs road condition — a PRODUCT problem**, fixable by choosing a
   higher-clearance motorcycle-form machine over a scooter.
2. **Apartment living vs charging access — a MARKET problem**, fixable only by swapping.
3. **Policy and swap infrastructure concentrated in Punjab — a STATE problem**, not fixable.

🟢 **The product half is actionable and gives a sharper answer to §I than spec comparison alone could:
for Karachi, a motorcycle-form machine with real ground clearance and ≥2,000 W — not a scooter.**

### ⚠️ 9. A THIRD VOLUME SERIES — recorded, and deliberately NOT differenced
> *"Last year, around **150,000** electric bikes and scooties were **sold** across Pakistan. **Fewer
> than 200,000 of the 2m bikes sold annually are now electric**, putting the adoption rate at **less
> than 10pc**."* — Faraz Zaidi. Total two-wheeler fleet: **>30 million.**

🔴 **This project did NOT subtract 111,844 from 150,000.** The day before, it retracted a published
import estimate produced by exactly that operation across exactly these kinds of sources.
**Different collectors, different bases, different periods. The gap measures nothing.**
🟢 **What it does move is penetration.** Zaidi's own arithmetic — fewer than 200,000 of 2m — gives
**~7.5%**, and he states **"less than 10pc."**

| Estimate | Figure | Status |
|---|---:|---|
| Withdrawn earlier in this project | 8–9% | ❌ mismatched populations |
| This project's corrected range | 4.5–5.5% | ⚠️ built on a **production** numerator |
| **Dawn / Wasl Mobility** | **~7.5%, "less than 10%"** | 🟢 **sales numerator, named source** |
| ICCT, India for comparison | 6.0% | 🟢 published methodology |

🔴 **The 4.5–5.5% range is probably too low, because its numerator is production and Zaidi's is
sales. The honest statement is now a wider band: roughly 5% to 7.5%, depending on whether you count
what was built or what was bought.** Still not a citable point figure — **but three independent
estimates now bracket it, and Pakistan sits at or above India's 6%.**

### ⚠️ 10. THE COMPANY COUNT, RECONCILED AT LAST
| Count | Source | What it counts |
|---:|---|---|
| **34** | EDB | **Licensed** manufacturers |
| **~40** | 🟢 **NCGCL CEO, Dawn** | **OPERATIONAL** OEMs |
| 64 / ~70 brands | Trade press | Companies and badges |
| 84 | Dawn, separate article | "companies and counting" |

🟢 **"Operational" is the qualifier that reconciles these** — ~40 actually build bikes; the larger
counts include badges, importers and dormant registrations. **It also lands close to the 34 EDB
licensees, so most operational OEMs are licensed and the 64/84 figures are counting something else.**
Khan's stated reason: *"it is much easier to manufacture a bike than a car."*

**The anchor-brand argument.** His diagnosis of weak demand is **fragmentation, not price**: the
market *"needs an **anchor brand**"*, as **BYD** proved for Chinese cars globally that they *"could
be good quality at a competitive price."*
⚠️ **A view, not a finding — but worth holding: in a market of ~40 OEMs with no quality signal, the
scarce asset is credibility, not capacity.**

### 🔴 11. THE PRICE GAP, RESTATED BY A LENDER
| | PKR |
|---|---:|
| **Honda CD 70** | **168,000** |
| **"A proper lithium-powered electric bike"** | **> 300,000** |

🔴 **The qualifier "proper" is doing real work.** This project's catalogue contains many lithium
machines under PKR 300,000. **A market financier's view is that below that price the lithium is not
"proper"** — consistent with `warranty-gap-and-coming-standards.md` and the cell-quality findings.
⚠️ **So the honest premium is not "PKR 255,000 vs 168,000" (+52%). It is "PKR 300,000+ vs 168,000" —
79% or more, for a machine that will not disappoint.**

**And the article's framing of what that machine must beat is the sharpest statement of the demand
problem this research has found:**
> *"On a Sunday, a family of five can climb onto a Honda CD 70 in North Nazimabad and head to the
> beach. On weekdays, the same bike can carry a commuter to work, a child to school and a delivery
> ride through an entire shift. **This is the benchmark electric two-wheelers have to beat.**"*

🔴 **Family load capacity requires ≥2,000 W peak** (Khattak, Elfa) — *"while electric scooties may
not have sufficient motor power, a bike with peak power of at least 2,000 watts can carry a heavier
load. But the greater the load, the faster the battery depletes."*
**Dawn's own conclusion, which this research should adopt rather than argue with:** in a market where
the motorcycle is expected to *"carry a family, survive poor roads, retain its value and remain
available for work all day, **low running costs alone may not be enough.**"*

### What the Dawn article changes
| Plan item | Status before | Status now |
|---|---|---|
| §3 Fleet / B2B beachhead | Open, assumed favourable | 🔴 **Refuted at 40,000-rider scale — 0.375%. Conditional on swapping** |
| §B Battery % of cost | Open | 🟢 **40–45% of retail** |
| §13 Residual value | Open | 🔴 **~50% lost at the showroom door** |
| §K Working capital | Theoretical | 🔴 **PKR 200m per 1,000 units/month. Budget covers ~250/month** |
| §L Which city first | Open | ⚠️ **Karachi is structurally the harder market** |
| §I Variant pick | Spec-led | 🟢 **Karachi ⇒ motorcycle form, high clearance, ≥2,000 W** |
| Route A (CKD) viability | Modelled | 🟢 **Confirmed operating — Elfa, battery localised** |

### The five highest-value open items from this article
1. 🔴 **Whether swapping actually solves the Foodpanda problem.** ChargePK is *"in talks"*; nothing
   is deployed. **The highest-value open question in the project — the fleet thesis depends on it.**
2. 🔴 **A second source for the PKR 200m working-capital figure.** One named CEO, one number, and it
   is now the binding constraint. **Do not act on a single quote.**
3. **Whether Rs 200m assumes CKD assembly or CBU import.**
4. **What Wasl Mobility and NCGCL will actually lend against, given 50% depreciation.** 🟢 **Both are
   building models, both are named, and both are in Karachi's financial sector — approachable.**
5. **Whether Elfa imports cells or assembles packs** — bears on Route B.

---

## 🔴 THE MAINTAINED DELIVERABLE — the Three-Market EV Atlas

**`ev-atlas.html`, created 28-Aug-2026 09:11, updated at nearly every sync since, last at
01-Sep-2026 20:29.** It supersedes `brief-2026-08-25.html`, `decision-board-2026-08-26.html` and
`investor-pitch-2026-08-26.html` as the maintained artefact — 🔴 **those three are now stale and
should be retired or explicitly marked with their date.** The `PDF/` set is stale on the same terms.

🔴 **The atlas is PUBLISHED AND SHARED WITH OTHER PEOPLE**, under a standing instruction from
Sheheryar (28-Aug-2026): *"keep upgrading the published artifact from now on, so everyone i shared
this with can see."*

🔴 **PUBLISHING IS NOT SHARING — AND OBEYING THAT INSTRUCTION TAKES TWO STEPS, NOT ONE.** The Share
panel pins a **specific version**, and it does **not** advance when you publish. It sat on
**Version 1 for nine days across eighteen publishes**, so the instruction above was inert and
nothing surfaced it. **`Latest` cannot be selected while access is *Anyone with the link*.**
**After every publish, re-pin the shared version by hand and verify it** — see the 07-Sep-2026
entry at the end of this file for the exact steps, the refusal message, and the browser gotchas.
🔴 **Its URL, its favicon (🛵⚡ — a REQUIRED publish parameter, not stored in the HTML, and not
recoverable by reading the artifact back), the re-bake rule for the 147-row model table, the
verification method, and the CVD-validated chart palette are all recorded in this workspace's memory
at `ev-atlas-artifact.md`. Read that before touching it.**

✅ **Verified 04-Sep-2026 against the local file: the atlas is current, and more carefully so than
expected.** It carries the 0.375% foodpanda refutation, the named operators on the record, the
Punjab concentration, the warranty gap, the Atlas Honda gap and the tariff regime. **It was not left
behind by the 28-Aug → 01-Sep work.** Both corrections are in it and correctly handled:
- **The PAVE subsidy is stated as the two tiers** — *"PKR 50,000 financed / PKR 80,000
  self-finance"* — and notes the financed figure is 37.5% lower than previously reported.
- **The 5.2× framing appears only as a labelled correction**, quoting the old claim and explaining
  why it was misleading, rather than asserting it.
- ⚠️ The **PKR 65,000** still in the file is the **NEV Policy** subsidy with its 80/60/40% taper —
  a different scheme from PAVE, correctly labelled. **Not a stale figure; do not "fix" it.**

---

## 🔴 WHAT THE 28-AUG → 01-SEP WORK DID TO THE DECISION

**The shape of the question changed. It is no longer "is there a business here" — that is largely
answered — it is "can this capital run it."**

1. 🔴 **The binding constraint moved from regulation to working capital.** Duty routes, EDB
   certification, supplier prices and the Fifth Schedule were all researched to primary-source depth
   over four days. **Then a named lender put the number at PKR 200m per 1,000 units/month, and a
   named, operating OEM said it cannot fund its next order.** Against PKR 50m of risk capital,
   **this is now the largest open question in the project, and everything upstream of it is settled
   work.**
2. 🔴 **The fleet beachhead was refuted and then rebuilt on one condition.** foodpanda at 0.375%
   killed "fleet as beachhead"; the 30-minute charge is why. **Fleet survives only as
   fleet-plus-swapping — and no deployed delivery-fleet swap network exists in Pakistan.**
3. 🟢 **Four independent arguments now converge on owning the battery rather than selling it:**
   warranty exposure (K5), residual value, grey-market quality signalling, and the 50% showroom
   cliff. **That is the most robust structural conclusion the project has produced.**
4. 🔴 **Karachi is the harder market, and the owner is in Karachi** — ground clearance against road
   surface, apartment living against charging access, and a policy/infrastructure ecosystem
   concentrated in Punjab. **Only the product layer is fixable.**
5. 🔴 **PAVE converted EDB certification from a duty question into a market-access question.** The
   subsidy runs only through EDB-approved models, so an uncertified entrant cannot compete on price
   at all — while for a certified assembler PAVE is a state-funded order book.
6. ⚠️ **Two demand figures now need re-running, not re-deriving:** the subsidised payback at
   **PKR 50,000 financed** (not 65,000 and not 80,000), and **every TCO at both the 15% and the 25%
   opex ratio**, because the current advantage carries a war premium on oil.
7. ⚠️ **Two operating costs are still missing from the fleet model entirely:** insurance
   (~PKR 2.4m/year on 200 machines) and the K-Electric connection charge, which is quoted per site
   and cannot be researched.
8. 🔴 **THE KILL CRITERIA HAVE NOT BEEN TOUCHED SINCE 26-AUG, AND THAT IS THE REAL GAP.**
   `01-question/kill-criteria.md` was last modified **26-Aug-2026**; its decision log holds **four
   entries, all dated 25-Aug**, all of them threshold-setting rather than findings. **Nine days of
   research have been written into `03-pakistan/`, `05-numbers/` and this file without a single
   criterion being tested against them.**
   🔴 **The log still records *"K1 — Ceiling set at PKR 50m floor. Capital does not bind"* as
   cleared. The working-capital finding directly challenges that**, and K4, K5, K8, K10 and K11 all
   now have evidence sitting against them unlogged.
   **This project's own instructions say the criteria exist so they "cannot bend to the answer" and
   the log exists "to stop the same ground being re-argued in six months." The governance device is
   the one document not being maintained.** ⚠️ **Thresholds are the owner's to move — but the
   *findings* should be logged regardless, and that is overdue.**

### 🔴 Standing caveat, restated as of 01-Sep-2026
**Contacted:** five Chinese suppliers, 27-Aug, from **`sheheryar.asif2@gmail.com`** — replies land
there, **not** in `.asif`. ⚠️ **As of 04-Sep-2026 the replies have not been checked in this
workspace.**
**NOT contacted — and every one of them now holds a decision-critical answer:**
**EDB** (further 500-unit batches? the official approved-model list?) · **banks, Wasl Mobility,
NCGCL** (K4, and what they will lend against 50% depreciation) · **delivery platforms** (the gate on
the whole fleet case) · **DG Customs Valuation Karachi** (Ruling 2061/2026) · **a clearing agent**
("KW" vs kWh, which IP band a traction pack gets, the stacking order) · **an insurance broker** (how
a zero-cc lithium vehicle is rated) · **K-Electric** (the per-site connection charge) ·
**PSQCA / IOCO / Sindh Excise**.
🔴 **The research has reached the edge of what desk work can settle. Nearly every remaining open
item is a phone call, not a search.**

---

## 04-Sep-2026 — 🔴 THE FIRST SUPPLIER REPLY, AND EVE'S OWN 45 °C NUMBER

**Eight days after the RFQ batch. One of five answered.** Register updated in
`02-supply/rfq-and-supplier-contacts.md`; the working record of the round is the artifact
`Five RFQs, One Reply` — **a SEPARATE artifact from the EV Atlas, and not a replacement for it.**

### 🔎 Account identity verified FIRST, per the 27-Aug lesson
The Gmail connector is on **`sheheryar.asif2@gmail.com`** — read off the message's own `sender`
field, **not** from label counts, which is exactly how the account was misreported on 27-Aug.
✅ **The rule held. Use it every time.**

### The tally
| Supplier | Result |
|---|---|
| **Hunan CTS** — the *dear* battery, PKR 113,939 @ 50u | 🟢 **Replied twice.** Emily handed off at **+10 h**; Rebecca sent substance at **+7 d** |
| Wuxi Keyway EV — the *cheapest* kit | 🔴 silent, 8 days |
| Wuxi SAIGE — top-6, 80k units/month | 🔴 silent, 8 days |
| BENLG — the "Benling" territory question | 🔴 silent, 8 days |
| **Koyosonic** — the *cheap* battery, PKR 59,281 @ 50u | 🔴 silent, 8 days |

Verified three ways — by supplier domain, by keyword across spam and trash, and against all 60
inbound threads since 27-Aug. **Nothing arrived from a personal address either. The negative
result is solid.**

🔴 **Read the silence, because it is data (K3).** **Both CKD suppliers are silent** — Keyway and
SAIGE were the entire *vehicle*-supply side of this evaluation. The battery layer answered; the
machine layer did not. 🔴 **And the cheap battery supplier is silent while the dear one engaged.**
The 2× spread this research leaned on is real, but **the half of it that answers the phone is the
expensive half.** The finding *"the arbitrage is a property of the SUPPLIER, not of the trade"*
now has a service dimension, and it points the wrong way for the cheap route.

⚠️ **Likeliest cause is length, not disinterest.** Nine numbered questions from a buyer claiming
no company, no volume and no premises is a lot of unpaid work for a sales desk.

### 🔴 THE REPLY ANSWERED 2 OF 9 QUESTIONS
Spec and cycle life only. **No price, no LCL, no crated weight, no warranty, no certification,
no cells-only, no payment terms.** It is a *qualification* conversation, not a quotation — and it
closed on a direct question (*"Is above specification suitable for your requirement?"*), so it was
**stalled on our answer, not theirs.**
🟢 **One genuinely new hard fact: the cell is EVE.** First time any supplier in this project has
named its cell manufacturer, and it bears directly on the grey-market cell-quality risk.

### 🔧 TOOLING — how the attachments were actually read
🔴 **The Gmail connector exposes attachment IDs and metadata but has NO download tool.**
🔴 **And the raw-MIME route does not work either** — `get_message` with `RAW` returns ~350 KB of
base64, which would have to be re-emitted in full to write a decodable file; output limits truncate
it, so the tokens are spent and no image results. **Do not attempt it.**
✅ **What worked: real Chrome (`claude-in-chrome`), which carries the live Gmail session.**
Navigate to `mail.google.com/mail/u/0/#inbox/<threadId>`, click the attachment chip, screenshot the
projector overlay. ⚠️ The renderer timed out once on CDP `Page.captureScreenshot` (30 s) — wait 3 s
and retry rather than re-clicking. ⚠️ Use element **refs** from `find`, not coordinates: scaled
screenshots make the coordinate frame ambiguous.
🔴 **`gh` (GitHub CLI) is NOT installed on this machine** — searched WinGet packages, Chocolatey,
Scoop, both Program Files trees, LocalAppData\Programs and the GitHubCLI folder. **No PR can be
opened from here.** Branch-and-push works; the PR itself has to be created in the browser.

### 🟢 THE PACK, FROM THE DATASHEET → `05-numbers/battery-import-cost.md` needs updating
**76.8 V 30 Ah LiFePO₄, 2.30 kWh.** Cell **EVE 3.2 V 15 Ah 32140** cylindrical, **24S2P**.
50 A smart BMS with over/under-voltage, over-current, short-circuit and over/under-temperature
protection. **CAN + Bluetooth + 4G.** 15 A max charge · **20 A continuous** · **40 A / 30 s peak**.
Sheet-metal/steel enclosure, sealing foam + structural sealant, **IP65**.
**225 × 195 × 415 mm · 18 kg.** Up to 2 packs in parallel.
🔴 **Operating temperature: *"To be confirmed according to cell and BMS configuration."*
The one question Karachi turns on is blank in their own datasheet.**

### 🔴 THE FINDING — EVE QUALIFIES ITS OWN CELL TO 60% FEWER CYCLES AT 45 °C
From the EVE cell document, §3.5.3.3 and §3.5.3.4. **Identical method** — 0.5C charge to 3.65 V
with 0.05C cut-off, 1.0C discharge to 2.5 V. **Only the ambient differs.**

| Protocol | Cycles logged |
|---|---|
| **§3.5.3.3 — 25 °C ± 2 °C** | **2,500** |
| **§3.5.3.4 — 45 °C ± 2 °C** | **1,000** |

🔴 **Karachi sits above 40 °C for much of the year, so the 45 °C column is the one that applies —
not the 25 °C headline every supplier quotes.** Against this project's modelled fleet duty of
**312–500 charge cycles a year**:
- 2,500 cycles → **5.0–8.0 years**
- 1,000 cycles → **2.0–3.2 years**

🔴 **This workspace has been carrying *"1,500 cycles @ 90% DOD = 3.0–4.8 fleet years"*
(`battery-import-cost.md`). The cell maker's own document does not support that at Karachi
temperature.** Pack life at fleet duty is roughly **half** what the model assumes.

⚠️ **STATE IT PRECISELY — this is exactly the trap this project keeps relearning.** These are
**test protocols** — *"record the capacity after N cycles"* — **not a stated end-of-life**, and the
excerpt gives **no retained-capacity threshold** (usually 80%). **It is NOT "the cell dies at 1,000
cycles."** The finding is the **asymmetry**, and it is the manufacturer's own. The absolute number
still needs Rebecca to state retained capacity at that point. **Do not put "1,000 cycles" in a
model as an endurance figure.**

### 🔴 THREE CORRECTIONS TO THIS PROJECT'S OWN RECORD
1. **The pack is 76.8 V / 2.30 kWh, not 72 V / 2.16 kWh.** Voltage and energy both understated.
2. **IP65 is confirmed** — so the customs valuation floor lands in the **top band** ($9/kg or
   $90/kWh, whichever is higher). 18 kg → **$162**; 2.30 kWh → **$207**; **$207 binds**, against a
   **$410** invoice, so **the floor still does not bite.** Conclusion unchanged, inputs now right.
   🟢 **And it confirms IP65 is what actually ships** — so the top band is the correct one to apply
   to Koyosonic too, where it **does** bite (+6.3%).
3. **Operating temperature is blank in the supplier's own datasheet** — record it as unanswered,
   not as "ambient rated".

### 🟢 TWO THINGS NOBODY HAD COSTED
1. **A 20ft container WEIGHS OUT before it CUBES OUT.** At 18 kg and 0.0182 m³ per pack:
   ~**1,550 packs** on a ~28 t payload against ~**1,800** on ~33 m³ of volume. **This settles the
   open caveat in the freight note** — the suspicion was right.
2. 🔴 **The pack ships with CAN, Bluetooth and 4G, at no stated premium.** A rental/BaaS operator
   collecting daily from riders with **no credit history** needs remote location, state-of-charge
   and immobilisation — that is the collection mechanism `rider-affordability.md` identified as the
   whole solve. **Zyp sells exactly this as "fleet-management software"; this pack has the hardware
   layer built in.** It was not in the model at any price. **Re-read the rental structure with it.**

### 📤 FIVE FOLLOW-UPS SENT — 04-Sep-2026, 13:36–13:37 UTC
Sent on explicit instruction after the concern was raised and re-affirmed. **All five went as
replies inside the original threads**, so the first RFQ sits below each.

| To | UTC | msg id |
|---|---|---|
| export@koyosonic.com | 13:36:52 | `1a06ca2ee36eed0d` |
| liqingxia@keywayev.com | 13:36:58 | `1a06ca307efbd704` |
| Info@saigebikes.com | 13:37:01 | `1a06ca3135f315d4` |
| sales@benlg.com · cc director@ | 13:37:06 | `1a06ca325fa5dcd9` |
| rebecca@ctsbattery.com · cc emily@ | 13:37:17 | `1a06ca35094db527` |

✅ **Verified by re-reading the `SENT` label, not by trusting the send call's return** — the
27-Aug rule, applied again. Drafts stayed at 4; pre-existing drafts untouched.
🟢 **Each was cut from nine questions to three**, with an explicit easy out. The three kept are the
ones that decide: **cells-only pricing** (Route B), **who honours a warranty claim from Karachi**
(K5), and **crated dimensions + gross weight**. **BENLG got ONE question** — whether the Pakistan
territory is already held — because nothing else matters if it is.
⚠️ **A second silence, against a three-question follow-up, is a far stronger signal than the first.
Read it as an answer.**

### 🔴 STILL OPEN FROM THIS ROUND
1. **Retained capacity at the 1,000-cycle mark** — without it, the 45 °C finding is directional.
2. **Pack operating temperature** — blank in their own datasheet.
3. **Every commercial term from every supplier.** Not one price has been quoted by anyone.
4. **Valuation Ruling 2061/2026** (lithium CELLS) — still not obtained, still governs Route B.

---

## 04-Sep-2026 — 🔴 THE PROJECT MOVED TO A NEW REPOSITORY

**New remote: `https://github.com/sheheryarasif2-cloud/Chinese-EV.git`.** Both repos — the project
folder on `main` and the memory folder on `memory-chinese-ev-research` — were repointed and pushed,
and **both were verified by re-reading the remote SHA**, not by trusting the push output
(`main` = `9019806`, memory = `9c0ec20`).

**What happened, in order, because the order matters:**
1. `CLAUDE.md`'s 28-Aug→01-Sep log had been committed to a branch, `docs/session-log-28aug-01sep`,
   intending a PR. 🔴 **`gh` is not installed, so no PR was ever created** — the branch simply sat
   one commit ahead of `main`. **Fast-forwarded into `main` with git and pushed.**
2. **Pushed to the OLD remote first**, so the work was safe before any remote was touched.
3. Repointed `origin` on both repos; **kept the old remote as `archive`** on both.
4. 🔴 **Updated `Sync-Workspace.ps1` line 29** — the origin guard hardcodes the expected URL and
   **throws** on anything else. Without this the hourly task would have gone red on the next run.
5. Proved it with `Sync-Workspace.ps1 -Check` — **exit 0, both folders verified.**

✅ **`docs/session-log-28aug-01sep` has been DELETED** — locally and on the archive remote, and it
was never carried to the new one. Deleted with `git branch -d` (which refuses an unmerged branch)
after confirming with `git merge-base --is-ancestor` that its tip `9019806` sits in `main`'s
history. **The commit survives; only the label is gone.** `main` is now the only local branch.

🔴 **The lesson for next time this happens: changing a remote is a THREE-part change, not one.**
The git remote, the sync script's hardcoded guard, and the documentation in this file all have to
move together. **Two of the three are silent when wrong** — the guard fails only on the next
scheduled run, and the documentation never fails at all.

---

## 07-Sep-2026 — 🔴 THE ATLAS HAD BEEN SHARED TO AN AUDIENCE OF ONE FOR NINE DAYS

**The most consequential finding of the day is not research. It is that the research was not
reaching anyone.**

### 🔴 THE SHARE WAS PINNED TO VERSION 1
The published EV Atlas has a **`Shared version`** control in its Share panel, **separate from
`General access`**. It was pinned to **Version 1 — the original 28-Aug-2026 publish — while
eighteen versions had been published.**

🔴 **So every republish between 28-Aug and 07-Sep reached exactly one person: the owner.** The
standing instruction of 28-Aug — *"keep upgrading the published artifact from now on, so everyone
i shared this with can see"* — **was structurally inert from the day it was given, and nothing
surfaced that.**

**What viewers were actually reading for nine days:** the 28-Aug page, which predates every
correction this project has made. **The PAVE two-tier subsidy correction (29-Aug), the "5.2×
national production" retraction (30-Aug), the import-gap self-correction, the Dawn named-operators
source (01-Sep) and the EVE battery finding (04-Sep) were all invisible to them.** They were not
merely reading a stale page — **they were reading figures this project had already withdrawn as
wrong, with no indication anything had changed.**

**Now set to `Version 18`**, the 07-Sep build. ⚠️ **Access was NOT changed** — still
*Anyone with the link*, still one named owner.

### 🔴 `Latest` IS MUTUALLY EXCLUSIVE WITH `Anyone with the link` — AND THIS WILL RECUR
There is a **`Latest`** option — *"Everyone with access sees new versions as soon as you publish
them"* — and selecting it was **REFUSED**, verbatim:

> *"Can't switch to Latest while people outside your organization can open this artifact.
> Change who has access first."*

**So while the atlas is publicly link-shared, the shared version is a STATIC PIN that does not
advance on publish.**

🔴 **THEREFORE, AND THIS IS THE RULE TO CARRY: PUBLISHING IS NOT SHARING.** After every publish of
this artifact the shared version must be **re-pinned by hand**, or viewers stay on the previous
one. **Re-pin in the same task as the publish, and verify it** — the Share button's own accessible
label states the state, e.g. *"Share, shared with anyone who has the link, sharing pinned version
1"*. **When no version clause appears in that label, no pin is set.**

**The standing alternative, not taken and the owner's call:** narrowing `General access` to
organization-only unlocks `Latest` and makes it self-maintaining — **but it breaks the existing
link for whoever it was already shared with.**

### 🟢 TOOLING — a real exception to a rule this project already recorded
🔴 This workspace records that **"neither browser tool can inspect a published artifact"** because
it renders in a cross-origin `*.frame.claudeuse` iframe. **That limitation does NOT extend to the
sharing controls.** The Share menu lives on the **claude.ai HOST page**, not inside the iframe, so
**real Chrome (`claude-in-chrome`) reads and operates it normally.** The earlier finding was about
the artifact's *content*; do not let it stop you checking its *sharing state*.

**How to check or change it:** navigate to the artifact URL → click **Share** → `find` the
**Shared version** combobox → click it → **scroll UP inside the list**; the newest version is at
the top and the list opens scrolled to the currently-pinned item.
⚠️ **Home and the arrow keys snap back to the selected item — scrolling works, keyboard does not.**
⚠️ **CDP `Page.captureScreenshot` times out on this page often** — wait 3–4 s and retry rather than
re-clicking, or a stray click lands somewhere unintended.

---

## 07-Sep-2026 — the atlas caught up, with the new findings made visible first

**The atlas had been frozen at 01-Sep while four days of evidence landed**, including one finding
that contradicted a figure the page itself stated. Verified two ways before touching it: the local
`ev-atlas.html` was last written 01-Sep 20:29, and the published artifact's own record said
*updated 2026-09-01*. **The local file was byte-identical to the live artifact** — the only delta
being the `</body></html>` the publish pipeline appends.

🔴 **Publishing to it required `action:"read"` first**, because this conversation had never
published the atlas. **A publish to an artifact the conversation has not read or published is
refused.** And from any conversation that did not publish it, **`url:` must be passed explicitly**
or a SEPARATE artifact is created and the shared link goes stale.

### What was added — a ranked *What changed* band
A dated band directly under the nav, with a **What's new** nav link ahead of *Verdict*. **Four
items ranked by how much each moves the decision, not by arrival order** — battery life at 45 °C,
the first supplier reply, three specification corrections, two newly-computed costs. Each carries
a mono **"Was on this page:"** line naming the figure it supersedes, and a jump link to the
section holding the detail. **Item 1 carries its caveat inline and unmissable** — test protocols,
not a declared end-of-life — because on a page other people read, "the battery dies in two years"
is the wrong thing to carry away and it is not what the document says.

### 🔴 THREE PLACES THE PAGE WAS ASSERTING SOMETHING FALSE
Not merely stale — **wrong**, which matters more on a shared page:
- The hero read **"no reply yet"**
- The Verdict's *"Three gates cannot be closed from a desk"* note said the same. **It now states
  that the one reply closed none of K3, K4 or K5** — no price, nothing on payment terms, nothing
  on warranty.
- The RFQ section carried no outcome at all
- The battery table's lithium row now shows the 45 °C figure beside the 25 °C one

### ⚠️ Two layout defects the render caught that structural validation would not
The band **inherited the page's `section` padding** (a dead strip inside its own top border) and a
global **`li{max-width:72ch}`** that left half the band empty while the `li` border-bottoms stopped
short. **Both were invisible in the markup and obvious in a headless render.** The method this
workspace already records — headless Chrome full-page screenshot of the LOCAL file, throwaway
`--user-data-dir`, crop with PIL before reading — **found them in one look. Keep using it.**

**Committed `3bb77e1`.** The 147-row model table was NOT re-baked, correctly: **no model data
changed**, and the re-bake rule applies only to that.
