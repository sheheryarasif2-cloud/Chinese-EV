# The customs valuation floor — and it exceeds two of my three supplier prices

**Recorded 29-Aug-2026.** Source: **Valuation Ruling 1964/2025**, Directorate General of Customs
Valuation, Custom House Karachi, dated **29.01.2025**, issued under **Section 25A of the Customs Act
1969**. Archived as `06-sources/customs-valuation-ruling-1964-2025-lithium.pdf`.

🔴 **This was a hole in the landed-cost model nobody had looked for.** Duty rates were known; the
*value the duty is charged on* was assumed to be the invoice. **It is not necessarily the invoice.**

---

## The ruling, verbatim in substance

**Subject: Determination of Customs Value of Lithium Ion Battery. PCT 8507.6000. All origins.**

| S. | Description | WeBOC PCT | \$/kg | \$/kW | Basis |
|---|---|---|---:|---:|---|
| 1 | Lithium Ion Batteries **(IP-20)** | 8507.6000.1000 | **7** | **70** | 🔴 **whichever is higher** |
| 2 | Lithium Ion Batteries **(IP-21)** | 8507.6000.1100 | **8** | **80** | whichever is higher |
| 3 | Lithium Ion Batteries **(IP-65)** | 8507.6000.1200 | **9** | **90** | whichever is higher |

**Values are C&F in USD.** Key provisions:

- **Para 7:** *"where declared values or values in invoice … are higher than the customs values
  determined in this valuation ruling, the assessment shall be made on higher values"* — **so it is
  a FLOOR, not a fixed price.**
- **Air freight:** the difference between air and sea freight **is added** for assessment.
- **Excluded:** batteries for **mobile phones, laptops, tablets and similar devices**.
- Applies until rescinded; revision petition under Section 25D within 30 days.

🔴 **The band is set by IP RATING** — and IP-65 (weatherproof) carries the highest values.

---

## 🔴 Applied to this project's actual candidates — it bites on two of three

Using **"whichever is higher"** of the per-kg and per-kW figures. ⚠️ The ruling writes **"KW"**;
for a battery this is almost certainly **kWh** (energy), but the ambiguity is the ruling's, not
mine — **confirm with a clearing agent.**

| Supplier | Weight | kWh | IP-20 floor | **IP-65 floor** | **Invoice** | Bites? |
|---|---:|---:|---:|---:|---:|---|
| **Koyosonic** 72V 35Ah | 15 kg | 2.52 | $176.40 | **$226.80** | **$213.32** | 🔴 **Yes at IP-65** |
| **Dongguan Rishengzhi** 72V 30Ah | 16 kg | 1.89 | $132.16 | **$169.92** | **$151.20** | 🔴 **Yes at IP-65** |
| **Hunan CTS** 72V 30Ah | 18 kg | 2.16 | $151.20 | $194.40 | $410.00 | 🟢 No — invoice far above |

### What that means

🔴 **For a Karachi fleet, the pack must be weatherproof — and weatherproof means the top band.**
The coming PSQCA standard explicitly requires resistance to **flooding and monsoon conditions**, and
Karachi floods annually. **So IP-65 is not an upgrade, it is the specification** — and it puts both
cheap packs *below* their own customs floor.

**Koyosonic:** assessed at **$226.80** against an invoice of **$213.32** — a **6.3% uplift** in the
tax base. At PKR 277.90 that is **PKR 63,027 assessed against PKR 59,281 invoiced, +PKR 3,746.**

**Dongguan:** assessed at **$169.92** against **$151.20** — a **12.4% uplift.**

🟢 **The absolute impact is modest** — duty on the EV-CKD route is 1%, and 0% on Route B cells — but
**sales tax at 18% and withholding at 11–12% are charged on the assessed value**, so the uplift
flows straight into those. On the Koyosonic pack that is roughly **PKR 1,100 per unit** in extra tax
base effect, before any duty.

⚠️ **It also partly erodes the Koyosonic advantage this research leaned on.** The 2× spread against
Hunan CTS is unaffected in absolute terms — but the cheaper the declared price, the more the floor
closes the gap. **A quote below the floor buys nothing at the border.**

---

## 🟢 And it is aimed squarely at the grey market

The ruling's own background is explicit: *"multiple representations from different stakeholders
regarding **massive under-invoicing** of subject goods by certain importers."* Ninety days of import
data were retrieved; **transaction value under Section 25(1) was found inapplicable "as in majority
of the cases, declared values did not correspond to market prices."**

🔴 **That is the state attacking the exact economics that make the scrap-cell trade viable.**
`charging-tariff-and-the-grey-market.md` argued Route B beats the grey market because it pays no
duty either. **This strengthens that**: the valuation floor removes the under-declaration advantage
regardless of duty rate, because **sales tax and withholding are assessed on the floor.**

## ⚠️ A second ruling exists that I do NOT have

**Valuation Ruling 2061 of 2026** covers **Lithium-ion CELLS (LFP, LiFePO4, Prismatic)** — a
different item from the batteries in 1964/2025, and **the item Route B actually imports.**

🔴 **Its values were not obtained.** Given Route B is the cheapest route into the battery and cells
are its input, **that ruling is now a required document, not an optional one.**
`[PLACEHOLDER: Valuation Ruling 2061/2026 values]`

## Open items

1. 🔴 **Obtain Valuation Ruling 2061/2026** — the cells ruling. Directly governs Route B's cost base.
2. 🔴 **Confirm whether "KW" in the ruling means kW or kWh.** It changes the floor by orders of
   magnitude on the per-kW column. **Clearing-agent question.**
3. **Confirm which IP band Customs assigns** to a 72V traction pack in practice.
4. **Whether the CKD concession route changes the valuation basis** — the ruling is written against
   8507.6000 generally, not against the Fifth Schedule route.
5. **Whether 1964/2025 has since been rescinded or revised** — it applies "until rescinded".

---

## ⚠️ A secondary source contradicts the primary PDF — the PDF wins

A trade-press summary of this ruling states: *"Values are per kilowatt (KW), **not per kg** or unit."*

🔴 **That is wrong.** The ruling PDF read directly shows **two columns** — `7/Kg` **and** `70/KW` —
under a header reading **"Whichever is higher"**. The aggregator dropped the per-kg column.

🟢 **This is the third time in this project that going to the primary document changed the answer**
(after the "10–15%" duty rate and the concession expiry date). **The per-kg column matters**: for a
heavy, low-energy pack it is the binding figure, and a model built on the per-kW column alone would
understate the floor.

## Valuation Ruling 2061/2026 — attempted, not obtained

Searched the FBR valuations listing and trade press directly. **The values for the CELLS ruling are
not publicly indexed anywhere found.** The ruling's existence and scope are confirmed
— *"Lithium-Ion Cells (LFP, LiFePO4, Prismatic)"*, issued because of *"significant discrepancies
between declared transaction values and prevailing market prices"* — but **no figures.**

🔴 **This must be requested from the Directorate General of Customs Valuation, Karachi, or from a
clearing agent.** It governs Route B's cost base and cannot be inferred from the batteries ruling.
