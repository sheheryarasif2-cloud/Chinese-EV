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
