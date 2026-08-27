# Battery import cost — the missing half of the landed-cost model

**Recorded 27-Aug-2026.** Converted at **USD 277.90** (interbank selling, dated
27-Aug-2026 15:56 PST — see `fx-rates.md`).

🔴 **This closes the gap `ckd-kit-pricing.md` flagged as blocking.** The CKD kits found earlier
(PKR 51,706–93,121 at MOQ 50) almost certainly exclude the battery. This file prices the
battery separately, from three named suppliers with published quantity tiers.

**These remain published listings, not quotes.** No supplier has been contacted.

---

## The three suppliers, same nominal spec, wildly different prices

| Supplier | Spec | Tier | **USD** | **PKR** |
|---|---|---|---:|---:|
| **Dongguan Rishengzhi New Energy** | 72V **30Ah** 1888Wh LiFePO4, 16 kg | **MOQ 500** | **151.20** | **42,018** |
| **Koyosonic Power** (Guangzhou) | 72V **35Ah** LiFePO4 + BMS, 15 kg | 50+ | **213.32** | **59,281** |
| Koyosonic Power | same | 30–49 | 225.54 | 62,677 |
| Koyosonic Power | same | sample | 280.00 | 77,812 |
| **Hunan CTS Technology** | 72V **30Ah** LiFePO4/NMC, 18 kg, 2000W | 100+ | **363.00** | **100,878** |
| Hunan CTS Technology | same | 50–99 | **410.00** | **113,939** |
| Hunan CTS Technology | same | 1–49 | 463.00 | 128,668 |
| Hunan CTS Technology | same | sample | 800.00 | 222,320 |
| **— Pakistani retail benchmark —** | **72V 30Ah LiFePO4, 16 kg, 70 km** | retail | — | **115,000** |

**Pakistani benchmark:** Maaz Electronics, listed at **PKR 115,000 discounted from PKR 150,000**
— and **out of stock**, which is itself a data point about supply depth.

Trade terms across the three: **FOB Shenzhen / Guangzhou**, EXW / CIF / DDU / DDP offered,
**T/T payment**, lead time **15–45 days**, certifications **UN38.3, CE, UL, KC, MSDS**.

---

## 🔴 The finding: the supplier spread is bigger than the import margin

At the **50-unit tier** — the tier K1's capital ceiling actually reaches — the same nominal
72V/30–35Ah lithium pack is offered at:

| | PKR | vs Pakistani retail 115,000 |
|---|---:|---|
| **Koyosonic 35Ah @ 50+** | **59,281** | **48% cheaper** — a real margin |
| **Hunan CTS 30Ah @ 50–99** | **113,939** | **essentially identical** — no margin at all |

**Two suppliers, same quantity, same nominal product, and one of them prices at Pakistani
retail before a single rupee of freight, duty, tax or clearing.**

🔴 **So the import arbitrage is not a property of the trade — it is a property of the
supplier.** Choosing wrong erases the entire margin. This is the clearest possible argument
that **listing prices cannot substitute for quotes**, and it applies to the CKD kits too.

## The volume cliff is real and steep

**PKR 42,018 at MOQ 500 against PKR 128,668 at 1–49 — the same pack is 3.1× cheaper at
volume.** MOQ 500 packs is roughly **PKR 21m of batteries alone**, or 42% of the PKR 50m
ceiling, before a single vehicle is bought.

**This is the MOQ chasm from `audited-financials.md` appearing again in the battery layer**,
and it cuts the same way: the best economics sit at an order size this capital base cannot
reach, and the reachable tier is where warranty backstop is weakest.

## What it does to the landed-cost stack

| Line | PKR |
|---|---:|
| CKD kit, cheapest complete (KeywayEV K037 @ MOQ 50) | 51,706 |
| **Battery, best 50-unit price (Koyosonic 72V 35Ah)** | **59,281** |
| **Sub-total, FOB, before everything else** | **110,987** |

🔴 **The battery costs more than the kit.** The suspicion recorded in `ckd-kit-pricing.md` is
confirmed with figures: at the reachable order tier, **the battery is 53% of FOB cost.**

Against Pakistani retail — cheapest e-bike PKR 97,000, volume band PKR 150,000–250,000 —
**a PKR 110,987 FOB starting point is far tighter than the kit price alone suggested.**
Freight, 1% or 15% duty, sales tax, withholding, clearing, assembly, warranty reserve and
dealer margin all still have to fit between PKR 110,987 and the shelf.

**The margin is real but it is not generous, and it depends entirely on landing the good
supplier rather than the average one.**

## Cycle life — now manufacturer-specified, not generic

Hunan CTS publishes **1,500 cycles @ 90% DOD** across its 72V range.

At the fleet duty cycle established in `fleet-model.md` — **312–500 charge cycles a year** —
that is **3.0 to 4.8 years of fleet service.**

✅ **This confirms the lithium fleet-life assumption from a manufacturer specification** rather
than the generic "2,000+ cycles" the model previously carried. The TCO model's lithium case
stands. Note the conservative reading: at the **500-cycle** end of the fleet range, it is
**three years, not five** — and Koyosonic warrants only **1 year below 50Ah**, which is exactly
the pack size a two-wheeler uses.

🔴 **A 1-year warranty on a 3-year asset is precisely the K5 exposure.**

## Open items

1. 🔴 **Quotes, not listings.** The 2× spread between Koyosonic and Hunan CTS at the same
   quantity is the whole argument for asking.
2. 🟢 **RESOLVED 27-Aug-2026 — see `03-pakistan/fifth-schedule-primary-text.md`.** The heading is
   **85.07**; the concession reads **"Batteries other than lead acid (PCT code 85.07)" at 1%** —
   **lead-acid is expressly excluded.** Statutory, with no concession: **8507.6000 carries CD 10%
   + RD 2% + ST 18% + IT 11%** (TIPP, Govt of Pakistan). 🔴 **And there is a better route than
   either:** lithium **cells** at **0%** (Fifth Schedule Part-I sr.143) or a full pack BOM at
   **0%**, for a Sales-Tax-registered lithium battery assembler on an IOCO quota — **no EDB
   vehicle certification required.** Given the battery is 53% of FOB cost, that route deserves
   testing on its own.
3. **Sea freight on lithium.** UN38.3 goods carry dangerous-goods handling; freight is not the
   same rate as the kit. `[PLACEHOLDER]`
4. **Whether a Pakistani assembler can source packs locally** at or below PKR 59,281 — Maaz's
   out-of-stock PKR 115,000 suggests thin local supply, but one retailer is not a market.
5. **Graphene / lead-acid pack pricing** — searched, not found with usable figures. It is the
   cheap tier the Chinese domestic market runs on, and the 8–13-month fleet failure mode.

---

# 🟢 Freight, and what the stack now looks like — 27-Aug-2026

**Sea freight, China → Karachi:** a **20ft container (20GP) is US$1,800–2,200**, quoted July 2026
and described as up ~25% month-on-month; **transit 9–10 days port to port.**
Grade: <span>freight-forwarder market reporting, not a quote</span>. Rates are volatile and
explicitly caveated as needing a fresh quote with 2–3 week validity at booking.

At **USD 277.90** (27-Aug-2026): **PKR 500,220 – 611,380 per 20ft container.**

⚠️ **Two honest caveats before this number is used:**

1. **Units per container is an ASSUMPTION, not a measurement.** A 20ft holds ~33 m³. If a crated
   CKD kit plus its battery occupies ~0.6 m³, roughly **50 units** fit — which would make freight
   **PKR 10,000–12,200 per unit**, about **9–11% of the PKR 110,987 FOB**. 🔴 **No supplier has
   given a crated volume or gross weight, so this is arithmetic on a guess.** A container can also
   "weigh out" before it "cubes out" — 50 kits plus 50 × 16–18 kg of battery is roughly 1.5–2.0
   tonnes of battery alone. `[PLACEHOLDER: crated dimensions and gross weight per kit]`
2. 🔴 **Lithium is dangerous goods.** UN38.3 cargo is not carried at the plain FCL rate —
   it needs DG declarations, and some carriers surcharge or refuse it. **The US$1,800–2,200 above
   is a general-cargo rate and almost certainly understates a battery shipment.**

## 🔴 The transit time contradicts what the suppliers said

| Source | Sea leg |
|---|---|
| Supplier listings (Koyosonic, Hunan CTS, Dongguan) | **25–35 days** |
| Freight-forwarder market reporting, Karachi | **9–10 days** |

**Both can be true** — the supplier figure looks like door-to-door including consolidation,
booking and destination clearance; the forwarder figure is port-to-port steaming time.
**Do not net them.** But it matters for the clock: with the concession ending **30 June 2027**, the
sea leg is likely **weeks, not months**, and the binding constraint is **EDB certification and
IOCO quota**, not shipping.

## Where the landed stack stands now

| Line | PKR/unit | Evidence |
|---|---:|---|
| CKD kit, cheapest complete (KeywayEV K037 @ MOQ 50) | 51,706 | listing |
| Battery, best 50-unit price (Koyosonic 72V 35Ah) | 59,281 | listing |
| **FOB sub-total** | **110,987** | |
| Sea freight, allocated *(assumption above)* | ~10,000 – 12,200 | market rate ÷ guessed fill |
| **CIF, approximate** | **~121,000 – 123,200** | |
| Customs duty — **if EDB-certified CKD** | **1%** on EV-specific components | primary law |
| Customs duty — **if not certified** | 15% non-localised · battery 10% CD + 2% RD | primary law |
| Sales tax, withholding, clearing, provincial cess | see `fifth-schedule-primary-text.md` §5 | primary law |

**Against Pakistani retail — cheapest e-bike 97,000, volume band 150,000–250,000 — a CIF around
PKR 121,000–123,000 leaves a real but not generous gap**, and the size of that gap is decided by
**whether EDB certification is obtained**, not by negotiating the kit price.
