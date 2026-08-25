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
  one pack replacement exceeds `[SET: ____ ]` of per-unit margin.
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
  costs more than `[SET: PKR ____ ]`.
- **Test:** OEM parts terms, plus real quotes for initial parts stock and technician training.
- **Why this is here:** thin parts support is the standard failure mode of imported vehicles.
  It surfaces late, after inventory is committed, and it destroys resale value and word of
  mouth simultaneously.

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

| Ref | Threshold | Value | Set on |
|---|---|---|---|
| K1 | Capital you can lose entirely | **PKR 50,000,000** (floor; USD pending a dated rate) | 25-Aug-2026 |
| K2 | Sustainable hours per week | **30** — income clause still unanswered | 25-Aug-2026 |
| K5 | Per-unit margin vs pack replacement cost | `[SET]` | |
| K8 | Ceiling for parts stock + training | `[SET]` | |
| K9 | Breakeven volume (falls out of K6) | `[SET]` | |

## Decision log

Every fired or cleared criterion gets a line — what was found, the source, the date, and what
it killed. This is the audit trail that stops the same ground being re-argued in six months.

| Date | Ref | Finding | Source | Killed |
|---|---|---|---|---|
| 25-Aug-2026 | K1 | Ceiling set at PKR 50m floor. Capital does not bind. | Owner | nothing |
| 25-Aug-2026 | K2 | Ceiling set at 30 hrs/week. Hours do not bind. **Income clause not tested.** | Owner | nothing |
