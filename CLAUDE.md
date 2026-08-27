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
  **1% CD on EV-specific CKD components**, 10–15% non-localised, under Table-II to Part-V(A),
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
  needed scale and localisation, not big subsidy.** 🔴 **Still missing and most important:
  Atlas Honda Icon e pricing** — the actual competitor.
- **25-Aug-2026** — promoted to a full standalone workspace, named **Chinese EV Research**.
  Folder renamed to `Documents\Chinese-EV-Research`; its own memory folder created and
  committed to a local git repo on branch `memory-chinese-ev-research`. **No remote yet** —
  see Backup status above. Not wired into `Sync-Memory.ps1` and not mirrored into the
  Supreme vault, deliberately.
