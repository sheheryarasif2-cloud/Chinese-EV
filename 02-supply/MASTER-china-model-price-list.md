# China — master model and price list

**Recorded 27-Aug-2026.**

## 🔴 Read the coverage boundary first — it is not like the other two

Pakistan and India were enumerable because both have a dominant public aggregator listing every
model with a price. **China does not, and cannot be enumerated the same way.**

What I actually hit:

- **Hundreds of manufacturers, thousands of SKUs.** Yadea alone sells dozens of variants;
  the top ten makers together shipped 3.29 million licence-plated motorcycles in 2025.
- **Brand sites are geo-restricted or broken from outside China.** `yadea.com.cn/product/`
  resolved to a 404 from here; others hang.
- **Real retail pricing lives on Tmall and JD.com**, which need sessions and show
  dealer-level, promotion-dependent prices that change weekly.
- **Heavy white-labelling.** A large share of output ships under other brands, so a "model list"
  is not even a stable concept at the ODM end.

**So this document gives verified price points and tiers, not an SKU catalogue.** Anyone claiming
a complete Chinese model list is either scraping a B2B storefront — self-declared, unverifiable —
or making it up.

---

## 🔴 The two most valuable numbers here are audited

From Yadea's FY2025 annual results, derived from the audited revenue table — **ex-works ASP
across 16.3 million units**:

| | Ex-works ASP |
|---|---:|
| **Electric bicycle** | **RMB 1,415** |
| **Electric scooter** | **RMB 1,878** |

**This is the factory-gate cost basis for the entire industry.** No retail number anywhere —
Chinese, Indian or Pakistani — can be understood without it.

## Verified Chinese domestic retail price points

| Brand | Model / tier | Price CNY | Specification |
|---|---|---:|---|
| **Tailg** 台铃 | promotional model | **2,999** | 1200W · **72V 21Ah graphene** · 60 km |
| **Yadea** | **Q1, DE3** | **3,299 – 3,499** | 🔴 **Sodium-ion — no lithium** |
| **Tailg** 台铃 | **M6** | **3,899** | 600W · 60V 23Ah graphene · 80 km+ |
| Yadea | G30 Lite | — | Sodium-ion |
| **Yadea** | **G6, T9** | **12,285 – 12,994** | Mid tier |
| **Yadea** | **Fierider, Y1S** | **27,950 – 31,785** | Premium |
| Sunra / Xinri | **Kemper, Keenes** | — | **100–160 km/h · 10 min to 80% charge** |

### 🔴 The finding: China's mainstream retails at CNY 2,999–3,899

That is the *retail* price of a complete electric two-wheeler with a 60–80 km range in its home
market — and it sits close to the **RMB 1,878 audited ex-works ASP**, which tells you Chinese
domestic distribution margin is thin.

Set that against Pakistan (PKR 97,000–290,000) and India (₹54,999–1,50,000).
`[PLACEHOLDER: RMB/PKR and RMB/INR rates + date]` — the multiples cannot be stated without dated
rates, **but the direction is unambiguous: the source market is dramatically cheaper than either
destination market.** Everything in between is freight, duty, tax and margin — which is exactly
the stack `03-pakistan/tariff-structure-current.md` exists to model.

### 🔴 And note what the cheap tier runs on

The CNY 2,999 Tailg and the CNY 3,899 M6 both use **graphene batteries — a lead-acid
derivative**, not lithium. So does the Yadea T5 sold in Pakistan `[VERIFY]`.

**The cheap Chinese product is lead-acid product**, and lead-acid dies in 8–13 months at fleet
duty cycles in Pakistani heat (`02-supply/battery-layer.md`). **The price advantage and the
failure mode arrive together.**

Yadea's sodium-ion Q1/DE3 at CNY 3,299–3,499 is the significant exception — **similar price, no
lead-acid, no lithium**, 92% capacity at −20°C and 80% charge in 15 minutes.

---

## The manufacturers — volumes where audited

| Company | 2025 units | Revenue | Net margin | Evidence |
|---|---:|---:|---:|---|
| **Yadea** 雅迪 | **16,269,200** (all e-2W) | RMB 37.01bn | **7.87%** | **Audited** |
| **Aima** 爱玛 | **11,639,817** (of which 2,615,982 e-motorcycles) | RMB 25.10bn | **8.11%** | **Audited** |
| **Xinri / Sunra** 新日 | 2,284,597 | RMB 4.11bn | 1.23% | **Audited** |
| **NIU** 小牛 | 1,192,039 | — | **loss** | **Audited** |
| **Luyuan** 绿源 | — | RMB 5.07bn (FY24) | 2.29% | **Audited** |

**Licence-plated electric motorcycle ranking 2025** (China Chamber of Commerce for the Motorcycle
Industry — ⚠️ irreconcilable with the audited filings above, see `audited-financials.md`):
Yadea 921,100 · Luyuan 591,500 · Zongshen 465,100 · Huaihai 344,900 · CFMOTO-ZEEHO 300,300 ·
Xinri 262,900 · Bus New Energy 206,900 · Wuxing 75,500 · Loncin 66,900 · Tailing 57,800.

**Also significant:** Tailg 台铃 (Shenzhen) · Segway-Ninebot 九号 (STAR) · VMoto/Super Soco (ASX) ·
Zongshen 宗申 · Loncin 隆鑫 · Huaihai 淮海 (**Pakistan base, MOQ 10,000/yr**) · Lifan · KEREN ·
Tromox · Horwin · Kamax.

**Aima product note:** 引擎MAX (Engine MAX) powertrain across the range, **3-year warranty on
lithium models** — a warranty term worth benchmarking against anything offered in Pakistan.

## The ODM / trading tier — where a small buyer transacts

**Wuxi MDKA New Energy · Wuxi Legend International · Zhejiang Taiya** and the wider B2B layer.

| | |
|---|---|
| MOQ | **50–200 units**; some quote 1–5 |
| CKD/SKD | Openly offered |
| Lead time | 15–25 days after deposit |
| Sea freight | 25–35 days |

⚠️ Self-declared listings — a **contact register**, never evidence of scale, quality or price.

---

## What this means for the entry decision

1. **The cost basis is now known and audited: RMB 1,415–1,878 ex-works.** Every landed-cost model
   starts there, not from a retail price.
2. **China's own retail is CNY 2,999–3,899 for mainstream.** The margin between that and Pakistani
   retail is the entire opportunity — and the entire tariff exposure.
3. **Cheap Chinese product is graphene/lead-acid.** Buying on price imports the failure mode.
4. 🔴 **Sodium-ion at CNY 3,299 is the development to watch.** Same price as lead-acid, none of
   the chemistry risk, from the market leader.
5. **The number that actually decides this business does not exist publicly** — an ex-works CKD
   quote at 50–200 units. It has to be asked for.

## Open items

1. 🔴 **Ex-works CKD quotes at 50–200 units** — the missing number.
2. Whether **sodium-ion models are export-available**, and at what price.
3. Model-level Chinese retail for Aima, Luyuan and Tailg — obtainable with a China-resident
   session on Tmall or JD.
4. Audited ex-works ASPs for Aima and Xinri, comparable to Yadea's RMB 1,415 / 1,878.
5. Aima's 3-year lithium warranty terms — the benchmark for K5.
