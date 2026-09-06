# Kill criteria — written before the research

**Written 25-Aug-2026. Nothing has been researched yet. That is the point.**

These exist so the go/no-go is decided by evidence rather than by how much time has already
been sunk. Criteria written after the research bend toward the answer you already want.

## How these work

1. **A kill criterion must be falsifiable.** It names a specific finding that ends the
   project or an entry mode. "The market is difficult" is not a criterion. "No OEM will
   appoint me and no existing distributor will supply me" is.
2. **Every threshold is set in advance, by you, and dated.** Moving a threshold after seeing
   the answer is allowed exactly once per criterion, and the move gets written down here with
   the reason. A second move means the criterion is fake.
3. **Scope matters.** Some findings kill the whole idea; most kill only one entry mode. Never
   let a mode-specific NO read as a project-wide NO, and never let a project-wide NO get
   relabelled as mode-specific to keep the idea alive.
4. **A NO is a result.** Reaching a defensible no in six weeks for the cost of some phone
   calls is the second-best outcome available, and far better than a maybe that quietly turns
   into spending.

## Markers used below

- `[SET]` — a number only you can decide. Fill it before testing that criterion, not after.
- `[VERIFY]` — stated from general knowledge and **not yet sourced**. Must be confirmed
  against a dated document saved in `06-sources/` before anything rests on it.

---

## Tier 0 — free, and answerable today

These cost nothing but honesty, and either can end the project before a single external call.

### K1 — Capital ceiling

- **Scope:** kills everything.
- **The question:** what is the most capital you can commit and still be fine if it returns
  zero?
- **Kills the project if:** minimum viable entry in every remaining mode needs more than
  **PKR 50,000,000** *(set 25-Aug-2026)*.
- **Precision:** recorded as a floor, not an exact figure — the answer given was "50 million
  or more". If a mode's requirement lands anywhere near that line, pin the number down before
  deciding on it. USD equivalent deliberately left blank: it needs a rate and a date, and an
  undated conversion is not a figure.
- **Test:** your own numbers. No research required.
- **Note:** set this as money you can *lose*, not money you could *raise*. A ceiling set at
  the maximum you could theoretically assemble is not a ceiling.
- **Re-check:** annually, or when circumstances change.

### K2 — Attention ceiling

- **Scope:** kills everything.
- **The question:** how much of your week can this have, sustainably, alongside existing
  commitments?
- **Kills the project if:** the mode needs more than **30 hours/week** *(set 25-Aug-2026)*,
  or requires giving up current income before it is cash-positive.
- 🔴 **The second clause is untested and does not go away.** A ceiling of 30+ hours a week
  alongside a Supreme Renewables role and ExaSnap does not add up as stated. Either it
  assumes stepping back from one of them — which is exactly the income clause — or the truly
  sustainable number is lower than the ceiling recorded here. **Settle which before using
  this threshold to justify an operationally heavy entry mode.**
- **Test:** your own judgement, honestly applied.
- **Note:** importing and distribution are operationally heavy — inventory, customs, dealers,
  warranty claims. Parts or charging may be lighter. If K2 is tight it may not kill the
  project so much as pre-select the mode.

### What these two thresholds being high actually means

Both Tier 0 ceilings were set high on 25-Aug-2026. **Neither is going to kill anything**, and
that moves where the discipline has to come from.

- **Tier 0 was meant to be the cheap filter, and it is now effectively open.** The go/no-go
  therefore rests on **Tier 1** — territory, ability to import, battery warranty. Those are
  still phone calls, so the project remains cheap to kill, but nothing is free any more.
- **Capital has stopped being the constraint, so K11 carries more weight than it otherwise
  would.** Being able to afford entry is not a reason to enter. With K1 non-binding, the
  question "what stops a larger player taking this position" is doing most of the real work,
  and it is the criterion easiest to wave through.
- **Watch for the ceilings drifting upward.** Rule 2 of this document allows one documented
  move per threshold. A ceiling set at the top of the range has nowhere to go except into
  money that was not supposed to be at risk.

---

## Tier 1 — cheap external checks, high chance of killing

Phone calls and emails. Do all of these before any modelling.

### K3 — Territory and rights

- **Scope:** kills import/distribution and assembly. Does **not** kill charging, parts, or
  service.
- **The question:** for each shortlisted Chinese OEM — who holds Pakistan rights today, is
  the arrangement exclusive, and would the OEM appoint anyone else?
- **Kills those modes if:** every shortlisted OEM is locked exclusively **and** none will
  appoint you **and** no existing rights-holder will supply you on workable terms.
- **Test:** OEM export desks and existing distributors, directly. Cost is time.
- **Evidence that resolves it:** a written or clearly-recorded position from each OEM — not
  an inference from the fact that a brand is already on sale here.
- **Re-check:** every 6 months. Distribution agreements lapse and get reassigned.

### K4 — Ability to import at all

- **Scope:** kills every mode that requires bringing goods in, which is most of them.
- **The question:** can you reliably open a letter of credit and settle abroad for this
  category, at the volumes required, right now?
- **Kills those modes if:** FX or LC access for vehicle or parts imports is closed, or
  unreliable enough that inventory cannot be planned.
- **Test:** your bank, plus the current State Bank position. `[VERIFY]` Import financing and
  LC access for vehicle categories has been a live constraint in Pakistan before — treat the
  position as time-sensitive, confirm it for the month you are actually deciding in, and save
  the source. Never carry this answer forward from memory.
- **Re-check:** quarterly. This one moves fast and without warning.

### K5 — Battery warranty and liability backstop

- **Scope:** kills import/distribution, and probably assembly.
- **The question:** who carries the battery warranty to the end customer, and is it backed by
  the OEM in a form you can actually claim against from Pakistan?
- **Kills those modes if:** the obligation lands on you with no enforceable OEM backstop, and
  one pack replacement wipes out the margin on **more than 10 units**. *(Set by Claude
  25-Aug-2026 on the owner's instruction — see "Who set K5 and K8" below.)*
- **Why a ratio and not a rupee figure:** neither the pack cost nor the per-unit margin is
  known until K6 is modelled, but this question can be answered today and the answer stays
  valid whatever those numbers turn out to be.
- **Why 10:** the arithmetic is that a threshold of N units breaks even at a claim rate of
  1/N. Ten units means the business survives claim rates up to 10% before warranty cost eats
  all margin. Stricter (5) demands a pack cheap enough that it would kill modes that could
  actually work; looser (25) requires believing claims stay under 4% in Pakistani heat, on an
  unverified pack, with no local failure data — that is a bet, not a threshold.
- 🔴 **Below roughly 30 units in the first year, ignore the ratio and treat K5 as fired.** At
  low volume a single claim is a large fraction of all margin earned, so variance decides the
  outcome rather than the rate. The backstop is mandatory at low volume regardless of maths.
- 🔴 **Warranty failure can cost you the right to sell — added 26-Aug-2026.** The exposure is
  not only financial. In India, refused warranty claims and unavailable spare parts drew the
  Central Consumer Protection Authority, and **the state of Goa suspended Ola Electric's vehicle
  registrations.** A backstop failure can therefore end market access, not merely erode margin.
  Treat regulatory consequence as part of K5, not a separate risk.
- **K5 has a remedy, unlike K3 and K4.** It is not a fact about the world — it is a term you
  can negotiate. When K5 fires, the response is to go and get an enforceable OEM backstop, or
  to fund a warranty reserve out of K1 and re-run K6 with that reserve deducted. Accepting the
  exposure is the one response that is never correct.
- **Test:** ask the OEM to state the warranty chain in writing; price one out-of-warranty
  pack replacement.
- **Why this is here:** an unbacked battery warranty is unbounded liability sitting behind a
  bounded per-unit margin. It is most lethal at low volume, where a handful of claims wipes
  out a year of trading.

---

## Tier 2 — modelling, once Tier 1 is survived

### K6 — Landed cost and tax incidence

- **Scope:** kills the specific mode being modelled.
- **The question:** what does one specific model actually cost, landed and on the road, and
  can it sell at that price with a margin worth having?
- **Kills the mode if:** landed cost plus required margin exceeds what the target buyer will
  pay, with no credible path to closing the gap.
- **Test:** build the cost stack for **one named model under its actual tariff line**, never
  a category average. `[VERIFY]` The heads to account for are understood to include customs
  duty, regulatory duty, additional customs duty, sales tax and withholding — confirm which
  actually apply to the exact HS code, and save the tariff document to `06-sources/`.
- **Rule:** no rate enters this model without a dated source. An assumed rate produces a
  confident wrong answer, which is worse than no answer.

### K7 — Policy dependence

- **Scope:** kills everything, if it fires.
- **The question:** does the business work **without** any EV-specific concession?
- **Kills the project if:** the case is only positive with a concession that can be withdrawn
  at a budget, and that withdrawal costs more than your K1 ceiling.
- **Test:** run K6 twice — once with every concession, once with none. Look hard at the
  second number.
- **Why this is here:** concessions granted by notification can be amended or withdrawn on a
  budget cycle. A business viable only inside a concession is a bet on policy, and it is a
  bet with someone else holding the timer.

### K8 — Parts and service pipeline

- **Scope:** kills import/distribution and assembly.
- **The question:** can you have parts, tooling and high-voltage-trained technicians in place
  *before* the first warranty claim, not after?
- **Kills those modes if:** the OEM will not commit to a parts pipeline, or standing one up
  costs more than **PKR 7,500,000** — 15% of the K1 ceiling. *(Set by Claude 25-Aug-2026 on
  the owner's instruction — see "Who set K5 and K8" below.)*
- **Why 15%:** this figure has to fit inside K1, because every rupee here is a rupee not
  available for vehicles. At 5% (PKR 2.5m) a genuine pipeline — parts stock, tooling and
  high-voltage technician training — probably cannot be built at all, so K8 would fire almost
  every time, and a criterion that always fires discriminates between nothing. Above 30% the
  after-sales operation becomes the main capital line, which is only coherent if parts and
  service *is* the business rather than support for vehicle sales.
- 🔴 **K8 spend reduces the capital available to K6.** If this ceiling is used in full, the
  money left for vehicles and working capital is **PKR 42.5m, not 50m**. Build K6's volume
  assumptions on the remainder, never on the K1 headline — that mistake makes a mode look
  viable at a volume the capital cannot actually fund.
- **Test:** OEM parts terms, plus real quotes for initial parts stock and technician training.
- **Why this is here:** thin parts support is the standard failure mode of imported vehicles.
  It surfaces late, after inventory is committed, and it destroys resale value and word of
  mouth simultaneously.
- 🔴 **26-Aug-2026 — India says this is THE criterion, not a secondary one.** Ola Electric held
  **over 50% of the Indian e-2W market in April 2024 and fell to 6.8% by H1 2026** — not on
  price, product or capital, but on service capacity and spare-part availability. 10,644
  consumer complaints, warranty claims refused, and **the state of Goa suspended its vehicle
  registrations** after a regulator probed unavailable spare parts. See
  `04-comparables/india-fame-shakeout.md`. **The PKR 7.5m ceiling was reasoned as a capital
  limit; India suggests underspending here is the failure mode, not the saving. Revisit it.**

---

## Tier 3 — demand, last

Only worth doing if nothing above has fired. Market sizing is the most enjoyable part of this
work and the least likely to kill it — which is exactly why it goes last.

### K9 — The actually-chargeable segment

- **Scope:** caps volume for every vehicle mode; may kill on volume.
- **The question:** how many buyers can reliably charge — home charging access, grid
  stability, and route coverage for their real usage?
- **Kills the mode if:** the chargeable *and* affordable segment is smaller than the volume
  K6 needs for breakeven.
- **Test:** define the segment by charging access **first**, then by affordability. Not the
  other way round.
- **Note:** this converts "the grid is a problem" into something testable. The grid is not a
  yes/no — it is a constraint that sets segment size.

### K10 — Financing and residual value

- **Scope:** caps volume; supports or undermines K9.
- **The question:** will banks finance these vehicles at rates buyers accept, and does the
  market believe in their resale value?
- **Kills the mode if:** no meaningful auto-finance availability **and** the cash-buyer
  segment alone sits below K9 breakeven.
- **Test:** two or three banks' auto-finance desks; used-market pricing for any comparable
  already here.

### K11 — Defensible position

- **Scope:** judgement, not arithmetic. Rarely a clean kill; often the honest one.
- **The question:** if you enter, what stops the largest incumbent — or the next three
  Chinese brands to arrive — from taking the position?
- **Kills the project if:** you would be the smallest player, on the worst terms, with no
  advantage beyond being early.
- **Test:** name the advantage in one sentence without using the words "service" or
  "quality". If you cannot, there may not be one.

---

## What is NOT a kill criterion

Guard against these. They feel like findings and are not:

- **"The market is crowded."** Crowded is not closed, and an empty market is usually empty
  for a reason.
- **"Someone experienced said it's hard."** Ask which of K3–K8 they hit. If they cannot name
  one, it is a mood, not evidence.
- **"The brand has a poor reputation."** Relevant to which OEM to pick, not to whether the
  business exists.
- **"It would be a lot of work."** That is K2, and K2 has a number. Use the number.
- **A single bad conversation.** One OEM declining is K3 evidence about that OEM only.

---

## The numbers only you can set

Fill each before testing the criterion it belongs to. Blank thresholds are how a project
talks its way past its own gates.

### Who set K5 and K8

**K1 and K2 were set by the owner. K5 and K8 were set by Claude on 25-Aug-2026, at the
owner's explicit instruction to decide them.**

That distinction is recorded because it changes how much weight they carry. K1 and K2 are
facts about the owner's circumstances that nobody else could supply. K5 and K8 are judgement
calls reasoned from the structure of the business, and the reasoning behind each is written
next to it — so they can be checked, argued with, and changed.

🔴 **Override either without ceremony, and do not treat doing so as spending the one
threshold move allowed by rule 2.** That allowance protects thresholds the owner set against
being bent to fit an answer. It does not apply to a number the owner never chose.

| Ref | Threshold | Value | Set on |
|---|---|---|---|
| K1 | Capital you can lose entirely | **PKR 50,000,000** (floor; USD pending a dated rate) | 25-Aug-2026 |
| K2 | Sustainable hours per week | **30** — income clause still unanswered | 25-Aug-2026 |
| K5 | Per-unit margin vs pack replacement cost | **10 units' margin** *(Claude)* | 25-Aug-2026 |
| K8 | Ceiling for parts stock + training | **PKR 7,500,000** = 15% of K1 *(Claude)* | 25-Aug-2026 |
| K9 | Breakeven volume (falls out of K6) | `[SET]` — cannot be set until K6 is modelled | |

## Decision log

Every fired or cleared criterion gets a line — what was found, the source, the date, and what
it killed. This is the audit trail that stops the same ground being re-argued in six months.

| Date | Ref | Finding | Source | Killed |
|---|---|---|---|---|
| 25-Aug-2026 | K1 | Ceiling set at PKR 50m floor. Capital does not bind. | Owner | nothing |
| 25-Aug-2026 | K2 | Ceiling set at 30 hrs/week. Hours do not bind. **Income clause not tested.** | Owner | nothing |
| 25-Aug-2026 | K5 | Set at 10 units' margin — breaks even at a 10% claim rate. Fires automatically below ~30 units/year. | Claude, delegated | nothing |
| 25-Aug-2026 | K8 | Set at PKR 7.5m (15% of K1). Leaves PKR 42.5m for vehicles and working capital. | Claude, delegated | nothing |
| 26-Aug-2026 | K7 | Consumer TCO: payback **13–18 months with NO subsidy**, and the case survives every battery assumption tested. | `05-numbers/tco-model.md` | nothing — K7 favourable |
| 26-Aug-2026 | K7 | Fleet TCO: payback **4.0–6.4 months with NO subsidy**. Rider fuel spend PKR 17,841/mo vs PKR 1,736 electricity. | `05-numbers/fleet-model.md` | nothing — K7 favourable |
| 26-Aug-2026 | K8 | 🔴 India: Ola went **>50% share (Apr-2024) → 6.8% (H1-2026)** on service capacity and spare parts — not price, product or capital. 10,644 complaints; **Goa suspended its registrations.** | `04-comparables/india-fame-shakeout.md` | nothing — but K8 becomes the deciding criterion |
| 26-Aug-2026 | K11 | Atlas Honda holds **~85–88% on ~1.69m units**, 500+ dealers, 63 service/parts points, and launched an electric scooter stating it needs no additional EV investment. | `03-pakistan/petrol-baseline.md` | pressures K11 hard |
| 27-Aug-2026 | K11 | 🟢 **Atlas Honda ICON e: PKR 419,900, 1.58 kWh FIXED pack, 65 km.** Unusable for a rider doing 80–128 km/day. **The incumbent took a premium consumer position — the fleet gap is confirmed open by the only firm that could have closed it.** | `03-pakistan/MASTER-model-price-list.md` | nothing — K11 improves |
| 27-Aug-2026 | K5 | First K5 evidence, and it is unfavourable: **Koyosonic warrants 1 year below 50Ah** — exactly the two-wheeler pack size. | `05-numbers/battery-import-cost.md` | nothing yet — K5 exposure opens |
| 27-Aug-2026 | K6 | Tariff regime read from **primary law** (Fifth Schedule as substituted by Finance Act 2026): EV CKD components **1%**, four battery routes, ACD **not** payable per SRO 1063(I)/2026. | `03-pakistan/fifth-schedule-primary-text.md` | nothing — K6 substantially advanced |
| 27-Aug-2026 | K7 | Concession sunset fixed **in primary law at 30-Jun-2027** — *"on and from the 1st day of July, 2025 till 30th day of June, 2027"*. ~10 months of runway. | Gazette p769 | nothing — K7 clock started |
| 27-Aug-2026 | K3 · K4 | Five RFQs sent to suppliers' own published addresses. The desk-research caveat is partly void from here. | `02-supply/rfq-and-supplier-contacts.md` | nothing — evidence gathering opens |
| 28-Aug-2026 | K4 | 🟢 First K4 datapoint: **Tycorun accepts L/C** (*"L/C, T/T, D/P…"*). At least one supplier will trade on a letter of credit. | `03-pakistan/swapping-and-the-punjab-concentration.md` | nothing — K4 indicator, not a test |
| 28-Aug-2026 | K4 | 🟢 **Mitigation Action Facility names HBL and Meezan** lending against EV assets behind EUR 3m of first-loss guarantees — a 6.2× leverage structure. A K4 route not previously considered. | same | nothing — K4 route found |
| 28-Aug-2026 | K11 | 🔴 **ELFA is a Wavetec subsidiary** (37-year multinational) and holds **Bykea in Karachi**. Zyp is VC-backed with its own 12,000/yr factory in Lahore. **Neither is a weak incumbent** — though neither has been measured. | `05-numbers/operating-costs-and-the-competitor.md` | pressures K11 |
| 28-Aug-2026 | K8 | Insurance was **absent from the model entirely**: ~PKR 2.4m/yr on 200 machines, Karachi rated higher-risk, and **no insurer's approach to a zero-cc lithium vehicle was found.** | same | nothing — K8 cost base raised |
| 28-Aug-2026 | K10 | Generic e-bike residuals: 15–25%/yr, 50–60% retained at three years, *"depreciation can be high due to concerns about battery life."* ⚠️ Not Pakistani data. | same | nothing — superseded 01-Sep |
| 29-Aug-2026 | K5 | 🔴 **K5 QUANTIFIED. Pakistani competitors warrant 2–5 years** (ELFA 3yr/50,000 km, Okla 5yr, Yadea 24mo/20,000 km); **the reachable supplier warrants 1 year.** On 200 machines a 15% failure between years 1–3 at ~PKR 60,000 is **PKR 1.8m unfunded** — and 15% is a guess, no failure data exists. | `02-supply/warranty-gap-and-coming-standards.md` | 🔴 **FIRES for import-and-sell** |
| 29-Aug-2026 | K5 | 🟢 The remedy K5 anticipates, found: **a rental/BaaS operator warrants nothing to a rider — it keeps the fleet running.** Contingent liability becomes a forecastable operating cost. | same | nothing — this is K5's documented remedy |
| 29-Aug-2026 | K6 | 🔴 **The value duty is charged on is not necessarily the invoice.** Valuation Ruling 1964/2025 sets a floor by IP rating; at IP-65 it **bites on two of three candidate packs** (+6.3% and +12.4% of tax base). | `05-numbers/customs-valuation-floor.md` | nothing — K6 corrected, not killed |
| 29-Aug-2026 | K7 | 🔴 **NEW EXPOSURE. PAVE supplies only EDB-approved models**, so the subsidy makes approved machines cheaper than anything an uncertified importer can land. **This converts EDB certification from a duty-rate question into a market-access question.** | `03-pakistan/pave-supply-answered.md` | 🔴 **kills uncertified CBU import on price** |
| 30-Aug-2026 | K9 | Market is **supply-constrained** — +173–191% growth with *"almost all dealers in short supply."* Entry need not displace anyone. | `03-pakistan/market-size-corrected.md` | nothing — favourable to K9 |
| 01-Sep-2026 | K1 | 🔴 **CHALLENGES THE 25-AUG CLEARANCE.** NCGCL CEO, named, in Dawn: **PKR 200m working capital per 1,000 units/month before a single bike is sold.** PKR 50m supports ~250 units/month pro-rata — **and only by consuming the entire ceiling**, leaving nothing for K8's 7.5m, premises or losses. A named, operating, catalogued OEM (Elfa) *"is scrambling to get money to order more material."* | `03-pakistan/dawn-29aug-named-operators.md` | 🔴 **kills 1,000-unit/month assembly. Does NOT kill the project** — see note below |
| 01-Sep-2026 | K9 | 🔴 **THE FLEET BEACHHEAD, TESTED IN THE MARKET AND FAILED.** foodpanda: **~40,000 riders, ~150 electric = 0.375%.** The reason is **charging time, not price** — ~30 minutes is one lost delivery for a piece-rate worker. | same | 🔴 **kills fleet-without-swapping** |
| 01-Sep-2026 | K9 | ~**100 DC chargers nationally**; ChargePK has 2,500 users of whom **two** are for bikes; many DC units exclude bikes and many bikes cannot use the standard. 🟢 Charging is solved **socially** instead — extension leads, ground-floor neighbours, kiryana stores. | same | caps K9; does not kill |
| 01-Sep-2026 | K10 | 🔴 **~50% of value lost the moment it leaves the showroom.** A lender's security is worth half the loan on delivery. **Supersedes the 28-Aug generic figure** — this one is Pakistani and named-source. | same | 🔴 **kills asset-backed lending. Does NOT kill the project** — finance against cash flow instead |
| 01-Sep-2026 | K10 | 🟢 The structural answer already exists: **Wasl (SECP NBFC) lends cash-flow-based with no hard collateral**, foodpanda built it, NCGCL is building a 2W EV model. Collect from platform earnings before payout. | same · `05-numbers/rider-affordability.md` | nothing — pre-selects rental over sale |
| 01-Sep-2026 | K8 | Road Prince/Yadea is spending **~US$10m on 3S dealerships** — sales, service, spare parts. **The world's largest e-2W maker, entering Pakistan, is spending on precisely the variable India says decides the outcome.** Against a PKR 7.5m ceiling this is not a contest. | `02-supply/warranty-gap-and-coming-standards.md` | 🔴 **kills retail-network competition; not a self-serviced fleet** |
| 04-Sep-2026 | K3 | 8 days on: **1 of 5 replied — and it is a battery supplier, not a vehicle OEM. Both CKD suppliers silent.** ⚠️ **K3's own evidence rule requires a recorded position from each OEM, not an inference. Silence does not meet it.** Earlier framing that "a non-reply answers K3" was too strong. | `02-supply/rfq-and-supplier-contacts.md` | nothing — **K3 remains UNRESOLVED, not answered** |
| 04-Sep-2026 | K5 | The one reply **did not answer warranty at all** — question 6 of 9, unanswered, along with price and cells-only. Re-asked in the 04-Sep follow-up. | same | K5 stays fired |
| 07-Sep-2026 | K5 | 🔴 **EVE qualifies its own cell to 1,000 cycles at 45 °C against 2,500 at 25 °C** — identical method, ambient the only difference. At fleet duty that is 2.0–3.2 years, not 3.0–4.8. **Raises the claim rate K5's 10-unit ratio is built on.** ⚠️ Test protocols, not a declared end-of-life. | EVE cell doc §3.5.3.3/§3.5.3.4 via Hunan CTS | **worsens K5; does not change what it kills** |

**Log brought current 07-Sep-2026, covering 26-Aug → 07-Sep.** 🔴 **No threshold was moved.**
Findings were logged against criteria; every number in the table above is still the one set on
25-Aug. Rule 2's one allowed move per threshold remains unspent on all five.

---

## Where each criterion actually stands — 07-Sep-2026

### 🔴 K1 — the 25-Aug clearance no longer stands as written

The log records *"Ceiling set at PKR 50m floor. Capital does not bind."* **That was true of the
question asked on 25-Aug and is not true of the business as now understood.** A named lender puts
working capital at **PKR 200m per 1,000 units/month**, and a named, operating OEM cannot fund its
next order.

**But read K1's own scope before concluding anything.** It kills the project only if *"minimum
viable entry in **every remaining mode** needs more than PKR 50m."* It does not:
a 50-kit first order is **~PKR 2.75m**, and a 200-machine fleet sits inside the ceiling.

🔴 **The honest restatement: capital does not kill the project, but it now selects the mode — and
it eliminates the mode a reader would otherwise default to.** Scale assembly is out on capital
alone. That is a real result, and it is exactly the mode-specific NO rule 3 exists to protect.
**Do not let it read as project-wide, and do not let it quietly disappear either.**

### ⚠️ K2 — untouched, and the untested clause now matters more

**No evidence was gathered against K2 in this period.** The income clause flagged on 25-Aug is
still unanswered.

🔴 **And the mode that survives everything else is the operationally heaviest one.** A rental/BaaS
fleet means daily collection, uptime obligations, swapping logistics and asset recovery — not a
30-hours-a-week business alongside two existing commitments. **K2's own note anticipated this:
*"If K2 is tight it may not kill the project so much as pre-select the mode."* It is now the other
way round — the surviving mode is testing K2, not the reverse.** Settle the income clause before
this goes further.

### 🔴 K3 — UNRESOLVED. Not cleared, not fired, and not answered by silence

Eight days, then a shortened three-question follow-up, and **one reply out of five — from a
battery supplier, not a vehicle OEM. Both CKD suppliers are silent.**

⚠️ **A correction to this project's own framing.** `CLAUDE.md` recorded that *"a non-reply is data
too — it answers K3."* **Measured against K3 as written, it does not.** The criterion demands
*"a written or clearly-recorded position from each OEM — not an inference from the fact that a
brand is already on sale here."* **Silence is an inference. K3's evidence standard has not been
met, and the criterion cannot be closed on it in either direction.**

### ⚠️ K4 — two favourable indicators, but the actual test has not been run

Tycorun accepts L/C; HBL and Meezan are named lending against EV assets behind the MAF guarantee.
🔴 **Neither is the test.** K4 says *"your bank, plus the current State Bank position"*, and adds
*"never carry this answer forward from memory."* **No bank has been contacted.** K4 is open, and
its `[VERIFY]` is unresolved.

### 🔴 K5 — FIRED for import-and-sell, with its own remedy already identified

The gap is measured: competitors warrant **2–5 years**, the reachable supplier **1 year on exactly
the relevant pack size**, and no OEM has stated a warranty chain in writing. The 04-Sep reply did
not answer warranty at all. The 07-Sep EVE finding **raises the claim rate the 10-unit ratio rests
on**, because a pack qualified to 1,000 cycles at 45 °C in a city above 40 °C will fail more often
than one qualified to 2,500 at 25 °C.

🟢 **K5's own text says accepting the exposure is never correct and that the criterion has a
remedy. The remedy is in hand: a rental/BaaS operator warrants nothing to a rider — it keeps the
fleet running, converting a contingent liability into a forecastable operating cost.** Four
independent lines of evidence now converge on owning the battery rather than selling it.

### ⚠️ K6 — advanced to primary-source depth, but NOT complete and NOT cleared

Tariff law, four battery routes, statutory rates, the ACD exemption and the valuation floor are
all read from primary documents. 🔴 **But K6's test is a cost stack for ONE NAMED MODEL under its
actual tariff line, end to end — and that has not been built.** No total incidence exists anywhere
(*"do not invent one"*), and **Valuation Ruling 2061/2026, which governs Route B's cells, has still
not been obtained.** **K9 cannot be set until this closes.**

### ⚠️ K7 — favourable on unit economics, newly exposed on market access

🟢 **The demand case survives concession withdrawal**, which is what K7 asks: 13–18 months consumer
payback and 4.0–6.4 months fleet payback **with no subsidy at all**.
🔴 **But a second policy dependence appeared that K7 did not anticipate. PAVE routes only through
EDB-approved models**, so an uncertified entrant cannot compete on price regardless of its own
economics. **That is policy dependence on the market-access side rather than the margin side, and
it is not cured by the unit economics being sound.** ⚠️ Also: the current opex advantage carries a
war premium (15% of petrol cost now, ~25% before) — **run both.**

### 🔴 K8 — fires for retail-network competition; does not fire for a self-serviced fleet

Against a **PKR 7.5m** ceiling, Road Prince/Yadea is spending **~US$10m** on a 3S network and Atlas
Honda already runs 500+ dealers. **Competing on dealer service coverage is not fundable and should
be treated as closed.** A fleet that services its own machines is a different and much smaller
requirement — but it has not been costed, and insurance (~PKR 2.4m/yr on 200 machines) was missing
from the model entirely.

🔴 **The ceiling itself deserves the owner's attention.** It was set by Claude as a *capital* limit;
India says underspending here is the failure mode, not the saving. **K8 is one of the two thresholds
this document says may be overridden without ceremony.**

### ⚠️ K9 — cannot be closed, but one variant of it is dead

The threshold `[SET]` still depends on K6. **What is settled is narrower and sharper: the fleet
channel without battery swapping is dead**, tested at 40,000-rider scale and failing at **0.375%**
on charging time. Public DC charging is effectively zero for two-wheelers. 🟢 Charging is being
solved socially, so adoption does not wait on a network — **but a rider's tolerance for downtime
does, and swapping is the only answer found.**

### 🔴 K10 — asset-backed lending is dead; cash-flow lending is the answer

**~50% of value lost at the showroom door** means a lender's security is worth half the loan on
delivery. That kills conventional auto finance for this asset and explains why two of the five
named operators in the Dawn piece are financiers building bespoke models. 🟢 **The structural answer
exists and is already operating**: cash-flow-based lending with no hard collateral, collected from
platform earnings before payout. **K10 does not kill the project; it eliminates one financing
structure and points at another.**

### 🔴 K11 — still the criterion doing most of the work, and still open

🟢 **The gap is real and confirmed by the only firm that could have closed it**: Atlas Honda's
ICON e is a 65 km fixed-pack premium consumer machine, useless to a rider doing 80–128 km/day.
🔴 **But the competitors who matter are not weak**: ELFA is a 37-year multinational's subsidiary
holding Bykea in Karachi; Zyp is funded with its own factory. And a market of ~40 operational OEMs
with no quality signal means **the scarce asset is credibility, not capacity.**

**K11's test is to name the advantage in one sentence without using "service" or "quality".**
The best candidate the evidence currently supports:

> *We own the battery and rent it by the day, collected from platform earnings before payout, so a
> rider with no deposit, no savings and no credit history can switch without financing anything.*

⚠️ **That is a candidate, not a cleared criterion.** It is defensible against Atlas Honda, which
has said it will not invest here — and **not obviously defensible against ELFA or Zyp, who are
already doing versions of it.** K11 stays open.

---

## What the log now says about the shape of the decision

**Nothing has killed the project. Four things have killed four modes**, which is the log working
as designed:

| Mode | Status | Killed by |
|---|---|---|
| Scale assembly at ~1,000 units/month | 🔴 out | **K1** — needs PKR 200m |
| Uncertified CBU import | 🔴 out | **K7** — PAVE prices it out |
| Import-and-sell with retained warranty | 🔴 out | **K5** — 1-year backstop vs 2–5-year competitors |
| Competing on a retail service network | 🔴 out | **K8** — US$10m vs PKR 7.5m |
| Fleet **without** swapping | 🔴 out | **K9** — foodpanda at 0.375% on charging time |
| **Fleet + swapping + battery-as-a-service** | 🟢 **survives** | — |

🔴 **The surviving mode is not surviving because it is the last one standing. It is the one every
independent line of evidence has pointed at** — warranty exposure, residual value, grey-market
quality signalling, the showroom cliff, and now the charging-time failure all argue for the same
structure. **That convergence is the strongest thing in this document.**

🔴 **And it is gated on three things no amount of desk research will settle:** whether a platform
will partner (K3-adjacent, and both foodpanda and Bykea already have EV partners), whether a bank
or NBFC will fund it (K4/K10), and whether the PKR 200m working-capital figure holds for a rental
fleet as it does for an assembler (K1). **All three are phone calls.**
