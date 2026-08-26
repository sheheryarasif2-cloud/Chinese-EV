# The battery layer

**Section B of the research plan. Recorded 26-Aug-2026.**

The outline treated vehicles as the product. Yadea's audited accounts say otherwise:
**batteries and chargers are 28.4% of its revenue, and it sold 18.3 million batteries against
16.3 million vehicles.** In this industry the battery is the recurring revenue, the largest
ownership cost, the main safety risk and the entire K5 liability.

**Evidence grade: press and retailer pricing for Pakistani figures; audited for Yadea's mix.**

---

## 🔴 The finding: Pakistani conditions destroy lead-acid, and lead-acid is what is arriving

| Chemistry | Pakistan price | Cycle life | Real-world life **in Pakistan** |
|---|---|---|---|
| **Lead-acid** | **PKR 10,000–20,000** | 300–400 cycles | 🔴 **dies every 12–15 months** in Pakistani heat and load-shedding |
| **Lithium-ion** | **PKR 40,000–120,000** | 2,000+ cycles (quality cells) | 3–5 years typical; 8–10 with good cells |
| Lithium polymer | PKR 50,000–100,000 | — | — |
| NiMH | PKR 25,000–50,000 | — | — |

A battery management system adds **PKR 10,000–20,000** and is what protects lithium cycle life.

### Why this is a warning, not a spec table

The trade evidence suggests **what is currently shipping from China to Pakistan is the cheap,
heavy, lead-acid end**: average declared value around US$350 per unit and average weight around
95 kg (`03-pakistan/import-volumes.md` — Comtrade, local use only).

Meanwhile China is **regulating lead-acid out** — the November 2024 national standard on
batteries and chargers, plus a trade-in scheme, drove lithium e-bikes from **4.62m units in 2024
to ~5.44m in 2025**. **The chemistry being pushed out of China is the chemistry an emerging
market absorbs.**

🔴 **Put those together and the K5 exposure is concrete.** A lead-acid pack that fails at 12–15
months, in a market where a 12-month warranty is normal, means **warranty claims begin arriving
just as the warranty expires — and customers will not accept that distinction.** India shows
where that ends: refused warranty claims, 10,644 consumer complaints, and a state government
suspending Ola's vehicle registrations (`04-comparables/india-fame-shakeout.md`).

## The ownership-cost arithmetic

Illustrative, using verified prices and one clearly-flagged assumption:

- Lead-acid at **PKR 15,000** replaced every **12–15 months**. At 15,000 km/year that is
  roughly **PKR 1.00 per km in battery cost alone**, before electricity.
- Lithium at **PKR 60,000** lasting 4 years at the same mileage is roughly **PKR 0.25 per km** —
  four times cheaper per kilometre despite costing four times more upfront.

⚠️ **`[ASSUMPTION: 15,000 km/year]`** — not sourced. It changes the ratio, not the direction.

**The commercial consequence:** the cheap bike is the expensive bike. A lead-acid machine priced
to undercut on the forecourt loses on total cost inside two years — and the customer blames the
brand, not the chemistry.

## Fixed vs swappable — a business-model fork, not a feature

Battery swapping is where the Chinese industry is investing: **US$370m (2024) → US$460m (2025),
heading to US$1.25bn by 2031, and 73.85% lithium.** Pakistan's **NEV Policy 2025-30 explicitly
plans swapping stations for two- and three-wheelers** among 3,000 charging points by 2030, with
commercial charging fixed at **PKR 39.7/kWh**.

Why this matters for a capital-constrained entrant:

- **It separates the battery from the vehicle.** The customer buys a cheaper machine; the
  operator owns the battery and earns recurring revenue — which is Yadea's 28.4% line, captured
  domestically rather than imported.
- **It solves the lead-acid trap** by making battery health the operator's problem, managed
  professionally, rather than a consumer's 15-month unpleasant surprise.
- **It fits fleet economics** — delivery riders swap rather than wait to charge.
- 🔴 **And it is something Atlas Honda has said it will not spend on.** Its stated position is
  that existing facilities suffice for expected EV demand (`03-pakistan/petrol-baseline.md`).
  Infrastructure is not a motorcycle factory.

**This is the most promising thread found so far**, because it survives the two findings that
killed the obvious plan: Pakistan's ~2m units of idle assembly capacity, and an incumbent with
~88% share and 500+ dealers.

## The tariff point that is easy to miss

**Batteries are not the vehicle's tariff line.** The EV concession distinguishes chemistries —
the 1% EV-specific component rate is documented as covering *"batteries other than lead-acid
batteries"*. **A lead-acid business may therefore not qualify for the concession at all**, while
lithium does.

🔴 **Confirm this before any landed-cost model is built.** If correct, it makes the cheap route
both technically worse *and* fiscally worse, and it points the economics at lithium regardless
of upfront price.

## What must be established next

1. **The domestic electricity tariff** — the commercial PKR 39.7/kWh is not what a home charger
   pays, and home charging is the mass-market case. `[PLACEHOLDER]`
2. **Verified kWh per 100 km** for a representative e-bike. Without it the running-cost
   comparison against PKR 5.85–6.10/km for a CD 70 cannot be closed.
3. **The exact Fifth Schedule wording on battery chemistry** — does lead-acid qualify?
4. **Fire-safety regulation in Pakistan**, if any. India's and China's standards both tightened
   after fires; Pakistan's position is unknown and is a liability question.
5. **Who carries the battery warranty in a CKD arrangement** — the K5 question, unanswerable
   without asking a supplier.
6. **Actual chemistry of what Pakistani brands sell today** — the import evidence implies
   lead-acid, but implication is not evidence.
