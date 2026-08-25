# The current tariff structure — answered

**Recorded 25-Aug-2026.** This resolves the item that was blocking K6.

Primary sources, both saved in `06-sources/`:
- **FBR, *Salient Features Budget 2026-27, Customs Act 1969*** — `FBR-Budget-2026-27-Salient-Features.pdf`
- **Board of Investment**, `invest.gov.pk/node/1651` — Fifth Schedule EV concession detail

---

## 🔴 Correction to what this workspace said earlier

`nev-policy-2025-30.md` recorded that the incentive regime expired on **30 June 2026** and
concluded "K7 has already fired." **That was too strong and is corrected here.**

The NEV Policy did say AIDEP 2021-26 incentives run "till the end of the policy period i.e June
30, 2026" — that quote is accurate. But the **Finance Act 2026 then extended the EV concessions
by one year.** The regime did not lapse. It was renewed.

The earlier conclusion was drawn from one document without checking whether a later instrument
had overtaken it. **A policy document's stated end date is not the same as the law in force** —
the finance act is what actually governs, and it is issued annually.

---

## What actually governs today

### The successor auto policy is NOT in force

**AIDEP / Auto Industry Development & Export Policy 2026-31** is still a **draft**. As of
reporting four days before this note, it "has not yet received final cabinet approval or been
formally notified through SRO", and requires sign-off from both the **Prime Minister and the
IMF**. Manufacturers are contesting the proposed tariff cuts.

Its draft provisions — CBU duty cuts, ACD phase-out by 2029, weighted average applied tariff
below 6% by 2030 — are **proposals, not law**. ⚠️ Note also that the published draft analysis
found **two-wheelers are not separately addressed** in it. Do not model against it.

### What is law: Finance Act 2026 / Budget 2026-27

Verbatim from the FBR salient features:

> "Extension in exemption on import of CKD for electric vehicles till **30.06.2027**"

> "Extension in date of **sunset** for electric vehicles till **30.06.2027**"

> "Extension of Exemption on Import of CKD kits for electric vehicles **for one year** extended
> to 30.06.2027"

**Sunset is FBR's own word.** This is a one-year bridge, not a settled regime.

### The rates for electric motorcycles

| Item | Rate | Basis |
|---|---|---|
| **PCT 8711.6040** — electric motorcycle | — | Pakistan's national tariff line for this product |
| EV-specific components, in any kit form, for assembly/manufacture | **1% customs duty** | Table-II to Part-V(A), **Fifth Schedule, Customs Act 1969** |
| Non-localised CKD parts | **10–15%** | Same schedule |
| Sales tax, NEV two/three-wheelers | 1% (vs 18% standard) | Reported; confirm against the Sales Tax Act schedules |

🔴 **The 1% rate is not automatic.** The concession requires **"certification and quota
determination by the Engineering Development Board (EDB)."** You cannot simply import at 1% —
**EDB must certify you and allocate quota.** That converts a tariff line into an approval
process, and it is a gate in its own right.

### Direction of travel — the Fifth Schedule is being pruned

> "REVIEW OF EXEMPTION REGIME (FIFTH SCHEDULE): Deletion of entries from the Fifth Schedule
> where concessionary CD equals or exceeds the First Schedule general tariff."

Separately, regulatory duty was cut by 20% across 1,347 tariff lines, and RD rates of 2.5%, 2%
and 1% were reduced or eliminated across 208 lines. The exemption regime is being actively
narrowed, consistent with the NEV Policy's stated intent to phase out special duty regimes by
2030.

---

## What this means for the decision

- **K6 is unblocked.** A landed-cost model can now be built on 1% EV-specific CKD, 10–15%
  non-localised, against PCT 8711.6040 — with the EDB certification requirement modelled as a
  precondition rather than a cost.
- 🔴 **K7 is sharper, not weaker. The cliff is 30 June 2027 — roughly ten months out.** What
  follows is unknown: the successor policy is stuck between the PM, the IMF and an industry
  fighting it. **Model the case with the concessions and again with none**, because the written
  direction of travel is removal, and the bridge is explicitly a sunset.
- ⚠️ **EDB certification is now a gate, not a formality.** It sits upstream of the 1% rate and
  connects to the licensing question that has no public register.

## Open items

1. Read Table-II to Part-V(A) of the Fifth Schedule itself for the exact component list and
   serial numbers — the BOI page summarises it.
2. Establish what EDB certification and quota determination actually require of an applicant.
3. Confirm the 1% NEV sales tax against the Sales Tax Act rather than press.
4. Watch for AIDEP 2026-31 approval; it will reset all of the above.
