# TCO — an electric bike against a Honda CD 70

**Section G of the research plan. Recorded 26-Aug-2026.**

The demand case was assertion until this existed. It now rests on verified inputs, and the
arithmetic is reproducible from them.

## Verified inputs

| Input | Value | Source grade |
|---|---|---|
| Honda CD 70 (2026) price | **PKR 159,900** | press, consistent |
| CD 70 real-world economy | **55–60 km/l** | press |
| Petrol | **PKR 343.10/l** (25-Aug-2026) | press |
| Yadea T5 (2026) price | **PKR 248,500** | retailer + manufacturer site |
| T5 battery | **72V 25Ah = 1.8 kWh**, 75–85 km range | manufacturer |
| T5 energy use | **"a full charge consumes around 2 units"** | **manufacturer's own statement** |
| Domestic tariff 2026 | PKR 3.95 lifeline → 47.20 (>700 units); **national average 33.38**; unprotected top slab **68.00** | NEPRA, SRO 279(I)/2026 eff. 12-Feb-2026 |
| Commercial charging | PKR 39.70/kWh | NEV Policy 2025-30 |

**Derived consumption: 2 kWh ÷ 80 km = 2.5 kWh per 100 km.**

---

## 🔴 Finding 1 — the running-cost advantage is enormous and it survives every tariff slab

| | PKR per km |
|---|---:|
| **Honda CD 70 (petrol)** | **5.72 – 6.24** |
| T5 @ lifeline 3.95 | 0.10 |
| T5 @ national average 33.38 | **0.83** |
| T5 @ commercial 39.70 | 0.99 |
| T5 @ above-700 slab 47.20 | 1.18 |
| **T5 @ unprotected top slab 68.00** | **1.70** |

**Even charged at the most expensive domestic electricity in Pakistan, the electric bike costs
about a third of the petrol bike to run.** At the national average it is roughly one-seventh.

This is the single most robust number in the project. It does not depend on a forecast, a
subsidy or a policy — only on the price of petrol and the price of a unit of electricity.

## Finding 2 — payback without any subsidy is 13–18 months

Purchase premium: **PKR 88,600**, or 55% over the CD 70.

At 15,000 km/year, running cost alone:

| Tariff | Saving/km | Breakeven | Months |
|---|---:|---:|---:|
| National average | 4.88 – 5.40 | 16,400 – 18,100 km | **13.1 – 14.5** |
| Above-700 slab | 4.54 – 5.06 | 17,500 – 19,500 km | 14.0 – 15.6 |
| Unprotected top slab | 4.02 – 4.54 | 19,500 – 22,000 km | 15.6 – 17.6 |

## Finding 3 — the case survives every battery assumption tested

The obvious objection is battery replacement. It does not break the model:

| Pack cost | Life | Battery PKR/km | Total PKR/km | Breakeven months |
|---:|---:|---:|---:|---:|
| 25,000 | 15 mo | 1.33 | 2.17 | 20.0 |
| 30,000 | 24 mo | 1.00 | 1.83 | **18.2** |
| 40,000 | 15 mo | 2.13 | 2.97 | 25.8 |
| **60,000** | **15 mo** | 3.20 | 4.03 | **42.1** |

**Even at PKR 60,000 replaced every 15 months — a deliberately punishing assumption — the
electric bike still saves PKR 1.69 per km.** Battery cost changes the payback period; it never
reverses the sign.

⚠️ **But note what the market leader is selling.** The T5's pack is described as a "graphene"
battery, and Yadea's graphene packs are **graphene-enhanced lead-acid `[VERIFY]`** — not
lithium. If so, the 12–15 month replacement cycle documented in `02-supply/battery-layer.md`
applies to the best-selling electric bike in Pakistan, and the middle rows of that table are the
real ones.

## 🔴 Finding 4 — the slab-crossing trap

This is specific to Pakistan and I have not seen it discussed anywhere.

Charging 15,000 km/year draws **375 kWh/year — about 31 kWh/month.** Pakistan's protected
domestic tariff applies at **200 units/month or below**, and crossing it **removes protected
status from the entire bill, not just the marginal units.**

| Household before | After charging | Outcome |
|---:|---:|---|
| 150 units/mo | 181 | stays protected |
| **175 units/mo** | **206** | 🔴 **crosses — loses protected status on the whole bill** |
| **190 units/mo** | **221** | 🔴 crosses |
| 200 units/mo | 231 | 🔴 crosses |

**The target customer is exactly the household this hits.** A CD 70 buyer is not a
700-unit-a-month household; they are plausibly in the 150–200 band, where an e-bike pushes them
over the line and re-prices *all* their electricity.

**Commercially this matters more than it looks:**

- The true marginal cost of home charging for that household is **not the slab rate — it is the
  loss of protected status across the whole bill.** A naive TCO pitch will be contradicted by
  the customer's next electricity bill, and that destroys trust fast.
- It creates a real reason to prefer **charging away from home** — public charging, swapping, or
  workplace charging — which strengthens the swapping thesis in `02-supply/battery-layer.md`.
- It makes **solar charging** a genuine differentiator rather than a marketing line, because it
  bypasses the slab entirely.

⚠️ `[PLACEHOLDER: exact protected vs unprotected slab rates from SRO 279(I)/2026]` — the
mechanism is confirmed; the rupee impact per household is not yet quantified.

## 🔴 Finding 5 — what the subsidy is actually worth, in one number

| | Premium | Breakeven | Payback |
|---|---:|---:|---:|
| **With PKR 65,000 NEV cost-sharing** | PKR 23,600 | 4,832 km | **3.9 months** |
| **Without** | PKR 88,600 | 18,141 km | **14.5 months** |

**The subsidy is the difference between an obvious purchase and a considered one.** Under four
months pays for itself before most buyers finish thinking about it; fifteen months requires
belief in the product, the brand and the battery.

And it **tapers to 80% in year three, 60% in year four, 40% in year five**, over a concession
regime that **sunsets 30 June 2027**. India already ran this: sales fell 53% in a month when
FAME-II lapsed — **and then the market grew anyway.**

## What this settles, and what it moves

🟢 **The consumer economics work.** Without any subsidy, at the worst electricity tariff, with a
punishing battery assumption, an electric bike still beats a CD 70. **Demand is not this
project's risk.**

🔴 **Which sharpens the actual risk considerably.** If the economics are this good, they are
equally good for Atlas Honda — which holds ~85–88% share, 500+ dealers, 63 service and parts
points, and has already launched the Icon e **without additional investment**.

**The question was never "will Pakistanis buy electric bikes." It is "can a new entrant with
PKR 50m be the one who sells them."** Sections D, E and now G all point the same way: the market
is real, and the incumbent is positioned to take it.

## Open items

1. **Atlas Honda Icon e price and specification** — the direct competitor, still undocumented.
2. **Confirm the T5's chemistry.** Graphene-enhanced lead-acid or lithium changes the middle of
   this model.
3. **Exact protected/unprotected slab rates** to quantify the crossing trap in rupees.
4. **Verify the annual-mileage assumption (15,000 km).** It scales every payback figure here.
5. Build the same model for a **fleet duty cycle** — 40,000+ km/year — where payback should
   collapse to a few months and the case becomes overwhelming.
