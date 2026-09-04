---
name: source-discipline-traps
description: The two research errors this project has made more than once — differencing figures across sources, and trusting a summary over the primary document — and the rule that prevents each
metadata:
  type: feedback
---

Two errors in this project have each been made more than once, both in ways that produced a
*plausible business conclusion* rather than an obvious mistake. That is what makes them worth a
memory: neither looked like an error at the time.

## 🔴 Trap 1 — never difference figures from different sources

**The rule: if two numbers come from different collectors, on different bases, or over different
periods, their difference measures nothing. Do not subtract them, and do not read a business
opportunity into the residual.**

Made three times:

1. **The withdrawn "~8–9% penetration" figure** (25-Aug-2026) — press electric numbers over a PAMA
   combustion-only denominator. PAMA's membership excludes almost every electric maker, so the
   numerator and denominator counted different populations.
2. **The "four in five e-2W are imported" hypothesis** (30-Aug-2026) — differenced ~112,000
   "sales" against EDB's 22,404 production and read a ~90,000-unit import gap. **The 112,000 was
   itself a production figure** (Mobile World Magazine, CY2025) against EDB's *nine-month* figure.
   No import gap existed. Retracted the same day.
3. ⚠️ **Nearly a third time** (01-Sep-2026) — Dawn gave a ~150,000 *sales* series alongside the
   111,844 *production* series. Caught and deliberately not differenced.

🔴 **Flagging the risk in the same breath as taking it is not the same as not taking it.** Error 2
was written up *with* its own caveat attached and still had to be retracted. **The caveat is not the
control; not doing it is.**

🟢 **What to do instead:** state each figure with its collector, basis and period, and leave the gap
visible. `CLAUDE.md`'s hard constraints already say this for mirror trade statistics — *"never
average two mirror statistics"* — it generalises to every pair of figures in this project.

## 🔴 Trap 2 — an aggregator or summary is not the document

**The rule: where a summary and a primary document disagree, the primary document wins — and the
summary is usually wrong by omission, not by contradiction, which is harder to notice.**

Going to the primary source changed the answer **four** times:

1. **"CKD duty is 10–15%"** — came from FBR's budget *summary*. The Fifth Schedule's own text says
   **15%, flat.** Corrected in five files.
2. **"Concessions expired 30-Jun-2026"** — the policy's stated end date. **The Finance Act overtakes
   it**; the concession now runs to 30-Jun-2027. *A policy's stated end date is not the law in force.*
3. **The customs valuation ruling "is per kilowatt, not per kg"** — trade press. The PDF has **two
   columns**, per-kg *and* per-kW, under *"whichever is higher"*. The aggregator dropped the per-kg
   column, **which is the binding one for a heavy, low-energy pack.**
4. **TIPP's exemption list** still cites a superseded SRO and contradicts its own validity dates.
   Its tariff table is current; its exemption list is stale. **Same site, different reliability per
   section.**

🟢 **Corollary that has held up:** where a *product page* and a *blog summary* disagree on price, the
product page is the better evidence — but record the spread rather than picking silently
(the swap-cabinet listings differ by more than 2× and the gap is still unexplained).

## Why this belongs in memory rather than in a file

Both traps cost real rework and both were re-committed after being identified once. The specific
figures live in the project folder with their sources; **what does not survive there is the pattern
— that this project's characteristic failure mode is arithmetic on mismatched sources, and its
characteristic save is opening the actual PDF.**

Related: [[ev-atlas-artifact]] — the artifact carries figures derived this way, so a retraction here
means a redeploy there.
