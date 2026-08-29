# The charging tariff has three numbers, and the grey market has an answer

**Recorded 29-Aug-2026.**

---

## 🔴 There is no single "EV charging rate" — there are three, and I modelled the middle one

`tco-model.md` uses **PKR 39.70/kWh**, the NEV Policy commercial charging figure. That is a
**policy cap**, not the tariff a charger actually pays.

| Rate | PKR/kWh | What it is |
|---|---:|---|
| **Residential off-peak** | **23.57** | NEPRA subsidised off-peak domestic |
| **NEV Policy commercial fast-charging cap** | **39.70** | 🔴 **The figure this research modelled** — a cap, excluding GST and service charges |
| **NEPRA EVCS tariff, base + adjustments** | **48.78** | The rate a public charging station category actually carries |

🔴 **The actual charging-station tariff with adjustments is HIGHER than the cap I modelled — 48.78
against 39.70.** So for a *public charging* business, the TCO's electricity assumption was
optimistic, not conservative.

🟢 **But for a fleet, the relevant number is lower, not higher.** A depot charging overnight is not
a public charging station. It buys at a **commercial or industrial connection (K-Electric base
18.50–28.50)** or, for a small operation, at **residential off-peak 23.57**. **Both sit well below
the 39.70 modelled.**

🟢 **And one caveat I raised earlier is partly answered:** I warned that K-Electric base rates
understate the bill because of FCA and QTA adjustments. Reporting states that
**EV charging stations are exempt from certain fuel cost adjustments that apply to other consumer
categories.** So the EVCS category avoids some of the adjustment load — though **whether a private
fleet depot qualifies as EVCS is exactly the question, and it is unverified.**

⚠️ **Grade honestly: all three figures are aggregator- and press-sourced, not read from a NEPRA
notification or an EVCS tariff schedule.** Given how much of this model rests on the electricity
price, **the EVCS tariff determination should be obtained before any of it is relied on.**

**Net effect on the decision:** the running-cost advantage stands either way. At the *worst* number
found (48.78) the electric bike still costs **≈1.22 PKR/km against petrol's 5.72–6.24** — roughly
**a fifth**. The conclusion does not turn on which of the three applies; only the margin does.

---

## 🔴 The grey market — and why Route B is the answer to it, not a victim of it

From the **National Assembly Standing Committee hearing, July 2026**:

> **"High import duties on lithium-ion batteries have encouraged a grey market in which unlicensed
> operators refurbished cells imported as scrap and sold them without registration."**

> It is **"operating openly because high import duties on genuine lithium-ion batteries have made
> the economics attractive and the absence of enforcement has made it risk-free."**

**Supporting findings from the same hearing:**

| Finding | Detail |
|---|---|
| Quality | **Low-quality batteries become unusable within 2–3 years** |
| Replacement cost | **Up to PKR 90,000** |
| 🔴 Licence gap | **EDB licences did not specifically require lithium-ion**, so licensees could fit cheaper lead-acid dry batteries and stay compliant |
| Import route | Nearly all lithium-ion is **imported**; used cells enter **as scrap** — Customs and Ministry of Commerce jurisdiction |

### 🟢 The reframing this deserves

At first reading this looks like a threat to Route B — legitimate cell imports competing against
untaxed scrap. **Read the duty structure again and it inverts.**

The grey market exists because **finished lithium packs carry CD 10% + RD 2%, and lead-acid carries
20–24%.** Those are the duties the committee is describing.

🔴 **But Route B imports CELLS at 0%** — Fifth Schedule Part-III serial 143, for a Sales-Tax-
registered lithium battery manufacturer on an IOCO quota.

**So a legitimate Route B operator faces the same zero duty the scrap importer evades — and beats
them on cell quality, BMS, testing and warranty.** The grey market's entire cost advantage is duty
avoidance on a duty that Route B does not pay.

⚠️ **Two things stop that being a clean win:**
1. **The scrap operator also avoids PSQCA, testing and any warranty obligation** — and PSQCA has
   **no lithium testing laboratory**, so nothing forces the comparison to be made at point of sale.
2. **The customer cannot tell the difference at purchase.** A pack that fails at 2–3 years looks
   identical to one that lasts 5 on the showroom floor. **That is a marketing problem, not a cost
   problem** — and it is precisely the problem a **rental or BaaS model does not have**, because the
   operator keeps the pack and bears the failure directly.

🟢 **Third time this session the same conclusion has arrived from a different direction:** warranty
exposure, residual value, and now grey-market quality signalling all argue for **owning the battery
and renting the service** rather than selling the machine.

### And one line that should change how EDB certification is read

> **"EDB licences did not specifically require lithium-ion, allowing some companies to use cheaper
> lead-acid dry batteries."**

🔴 **So an EDB licence certifies the assembler, not the chemistry.** The 34 licensees are not all
lithium builders — and the PAVE approved-model list, which routes through EDB approval, may
therefore include lead-acid machines. **That materially weakens the assumption that PAVE approval
implies a quality floor.** `[VERIFY: whether PAVE approval requires lithium]`

## Open items

1. 🔴 **The NEPRA EVCS tariff determination** — obtain it. Three conflicting numbers is not a basis
   for a cost model.
2. 🔴 **Whether a private fleet depot can register as EVCS** and take the FCA exemption.
3. 🔴 **Whether PAVE approval requires lithium**, given EDB licences do not.
4. **The scale of the scrap-cell trade** — no volume or value figure was given at the hearing.
5. **Whether the Customs valuation ruling on lithium cells** (referenced in trade press) has changed
   the scrap economics.
