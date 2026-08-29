# The fleet model — delivery riders

**Extension of section G. Recorded 26-Aug-2026.**

The consumer model (`tco-model.md`) showed the economics work but the market belongs to Atlas
Honda. This asks whether the fleet segment is different. **It is, and by a wide margin.**

## The rider, from real reporting

| | |
|---|---|
| Duty cycle | **80 km/day, 26 days/month** on a 125cc bike → **~24,960 km/year** |
| Efficiency | 35–50 km/l (125cc); 40 km/l used here |
| Reported fuel spend | **~PKR 800/day** (press, March 2026) |
| Earnings | **PKR 25,000–60,000/month**; new riders 35,000–42,000 |
| Known fleet size | **foodpanda 20,000+ riders**; **Bykea 30,000+** (2020) |

✅ **Cross-check:** 80 km ÷ 40 km/l × PKR 343.10 = **PKR 686/day** computed, against ~PKR 800/day
reported. Close enough to validate the model, and the gap is explained by longer days or worse
real-world efficiency.

⚠️ **Petrol price discrepancy to resolve.** This project verified **PKR 343.10/l on 25-Aug-2026**;
one press source cites PKR 414–415 "after the latest hike". Both are recorded, neither averaged.
**If the higher figure is right, every number below improves.**

---

## 🔴 Finding 1 — fuel is 30–71% of a delivery rider's gross earnings

**PKR 17,841 per month on petrol**, against earnings of PKR 25,000–60,000.

That is the strongest adoption argument anywhere in this project. It is not a lifestyle
preference or an environmental appeal — **it is most of a working person's income.**

Electricity for the same 80 km/day: **PKR 1,736 per month.**

## Finding 2 — payback is 4–6 months, with no subsidy at all

Purchase premium PKR 88,600 (Yadea T5 PKR 248,500 vs CD 70 PKR 159,900).

**At the verified 24,960 km/year:**

| Battery | Cycles/yr | Battery life | Net saving/mo | **Payback** |
|---|---:|---:|---:|---:|
| Lead-acid PKR 30,000 @ 350 cycles | 312 | **1.1 years** | PKR 13,877 | **6.4 months** |
| Lithium PKR 60,000 @ 1,500 cycles | 312 | 4.8 years | PKR 15,065 | **5.9 months** |

**At 40,000 km/year (128 km/day):**

| Battery | Battery life | Net saving/mo | **Payback** |
|---|---:|---:|---:|
| Lead-acid PKR 30,000 | 🔴 **0.7 years — 8 months** | PKR 22,239 | **4.0 months** |
| Lithium PKR 60,000 | 3.0 years | PKR 24,143 | **3.7 months** |

**Against 13–18 months for a consumer, fleet pays back two to three times faster** — and unlike
the consumer case it does not need the subsidy to be compelling.

## 🔴 Finding 3 — for fleet, cycle life replaces calendar life, and that changes the chemistry from preference to necessity

A consumer's battery ages by the calendar. **A rider's battery ages by the cycle**, and at
80–128 km/day against a 75–85 km range that is **312–500 cycles a year.**

Lead-acid is rated 300–400 cycles. So in fleet service it lasts **8 to 13 months** — before
Pakistani heat and load-shedding are even considered, which `02-supply/battery-layer.md` shows
already cut it to 12–15 months in gentler consumer use.

**Note what the payback table does *not* say.** Both chemistries pay back in roughly the same
time, because lithium's higher cost is offset by its longer life. **So the chemistry decision is
not an economic one — it is an operational and reputational one.** A rider whose battery dies in
month nine loses days of income, and never buys from you again. India's lesson exactly.

## 🔴 Finding 4 — at fleet mileage, swapping stops being optional

At 128 km/day against a 75–85 km range, a rider needs a **mid-shift recharge**. Conventional
charging takes 6–8 hours. **For someone paid per delivery, that is not an inconvenience, it is
lost wages.**

Benchmarks from markets that have already solved this:

- Swapping delivers **~15% lower total cost of ownership** than charging for high-utilisation
  scooters — zero downtime, and no battery replacement cost over the vehicle's life.
- Riders using swapping complete **20–40% more daily orders** and earn **15–35% more per month.**
- Typical swap modules are **1.6–3 kWh giving 80–120 km**, under 12 kg to handle.
- Fleet data puts average daily delivery running at **92 km** — squarely in the range where one
  charge is not enough.
- Lithium holds **73.85%** of the swapping market; the economics assume it.

**Swapping converts the battery from the rider's biggest risk into the operator's recurring
revenue** — which is the same 28.4% of turnover that batteries represent in Yadea's audited
accounts.

## 🔴 Finding 5 — this is the first time PKR 50m looks adequate rather than absurd

**Known fleet riders: 50,000+** across foodpanda and Bykea alone.

At Pakistani retail value, PKR 50m is roughly **200 machines**; at landed CKD cost, meaningfully
more. **So a first entry needs well under 1% of the known fleet market.**

Compare that with the consumer market, where the same capital buys the same 200 units against
Atlas Honda's 1.69 million a year, 500+ dealers and 63 service points.

| | Consumer | Fleet |
|---|---|---|
| Buyer decides on | Brand, trust, dealer proximity | **Arithmetic** |
| Customers to reach | Millions, dispersed | **Dozens of operators** |
| Retail network needed | Extensive | **None** |
| Payback offered | 13–18 months | **4–6 months** |
| Atlas Honda's position | ~88% share, already launched | **No stated infrastructure plan** |

## What this means for the thesis

**Fleet is the answer to the entrant problem, and it is the first thesis that survives every
finding so far.**

- It sidesteps **K11**, because fleet buyers choose on economics, not on the brand and dealer
  network Atlas Honda owns.
- It sidesteps the **~2m units of idle assembly capacity**, because the scarce asset is swapping
  and service infrastructure, not another factory.
- It sidesteps the **MOQ chasm**, because a few hundred units is reachable from the ODM tier.
- It does **not** need the subsidy to work — which is the whole point of K7.
- And it targets exactly what **Atlas Honda has said it will not invest in**: it stated existing
  facilities suffice for expected EV demand. A factory is not a swap network.

⚠️ **But it inherits the hardest criterion.** Fleet uptime is the product. If a battery dies
mid-shift, a rider loses income — so **K8 (parts and service) and K5 (battery backstop) become
even more decisive here than in the consumer case**, and India shows what happens when they are
underfunded.

## Open items

1. **Talk to the platforms.** foodpanda and Bykea rider counts, whether riders own or lease
   machines, and whether either would support an electric pilot. This is the K3 of the fleet
   thesis and it is a conversation, not a search.
2. **Resolve the petrol price** — PKR 343.10 vs 414–415.
3. **Swap-station capex per site** and the network density a city needs.
4. **Verify Pakistani rider mileage** independently — everything scales from 80 km/day.
5. **Whether riders can finance PKR 248,500** at all, or whether the model must be
   lease/rental rather than sale. **This may be the real question** — the payback is excellent,
   but a rider earning PKR 35,000/month cannot produce PKR 248,500 upfront.

---

# 🟢 The addressable market is larger than this model assumed — 28-29 Aug 2026

`fleet-model.md` has used **"50,000+ known fleet riders"** (foodpanda 20,000+, Bykea 30,000+).
That is the *sourced, conservative* figure. The wider platform economy is an order of magnitude
bigger:

| Measure | Figure |
|---|---|
| Pakistan's **total platform-economy workers** | **~1.5 million** |
| Of which **"location-based" work** — delivery and ride-hailing | **~0.5 million** |
| Bykea **bikes registered on the platform** | **500,000+** ⚠️ *2020 figure* |
| Named platforms | foodpanda · Bykea · Careem · Uber · Cheetay · Daraz · Gharpar |

⚠️ **Do not swap 50,000 for 500,000 in the model.** The figures measure different things:

- **0.5m "location-based"** includes **car ride-hailing drivers**, who are not addressable by a
  two-wheeler fleet.
- **Bykea's 500,000+ "bikes registered"** is a **2020 platform-registration count**, not active
  riders — registration on an app is not a working fleet, and it is six years stale.
- **50,000+** remains the only figure tied to *active delivery riders on named platforms*.

🟢 **What it does change:** the conclusion that a 200-machine fleet needs "under 1% of the known
market" was already comfortable. **Against a location-based workforce of ~500,000 it needs
0.04%.** The constraint on this business was never demand-side, and this widens the margin on that
point rather than altering it.

🔴 **What it does not change:** the addressable segment is still gated by **which platform will
partner**, not by how many riders exist — and `swapping-and-the-punjab-concentration.md` records
that **both foodpanda and Bykea already have EV partners.** A large TAM behind a closed door is not
an opportunity.
