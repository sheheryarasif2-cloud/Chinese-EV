# Price comparison — China, India, Pakistan

**Recorded 26-Aug-2026.** Companion to the three catalogue documents.

🔴 **No currency is converted anywhere in this document.** Doing so requires a rate and a date,
and an undated conversion is not a figure. Each market is shown in its own currency, and the
comparisons made are **structural** — which they can be, and which is where the insight is anyway.

`[PLACEHOLDER: RMB/PKR, INR/PKR, USD/PKR rates + date]` — supply these and every cross-currency
figure below can be computed.

---

## The three ladders, side by side

| Tier | **China** (CNY, retail) | **India** (INR, ex-showroom) | **Pakistan** (PKR, retail) |
|---|---|---|---|
| **Ex-works reference** | **1,415** e-bicycle · **1,878** e-scooter *(audited)* | — | — |
| **Entry** | **3,299–3,499** (Yadea Q1/DE3, sodium) | **74,000–95,250** (Hero Vida V2, TVS Orbiter) | **149,900–162,000** (Jolta JE-70D, Pakzon PE-70D, Okla Orbit) |
| **Mid** | **12,285–12,994** (Yadea G6/T9) | **1.01–1.44 lakh** (TVS iQube, Bajaj Chetak, Ather Rizta) | **220,000–290,000** (ELFA EV-1, Yadea T5/T5L, Metro E8S) |
| **Premium** | **27,950–31,785** (Yadea Fierider/Y1S) | **1.54–3.09 lakh** (Ather 450X, Ultraviolette F77) | **369,000–819,000** (Okla OMAX/OKG, Vlektra) |

**Petrol benchmark in Pakistan: Honda CD 70 at PKR 159,900.**

---

## 🔴 Finding 1 — the value chain is visible in the audited numbers

A Chinese electric scooter leaves the factory at an audited ex-works ASP of **RMB 1,878**.
Yadea's own T5 retails in Pakistan at **PKR 245,000**.

Everything between those two numbers — freight, insurance, customs duty, additional customs duty,
regulatory duty, sales tax, withholding, clearing, inland freight, distributor margin, dealer
margin — **is the business.** That stack is what `05-numbers/` must model line by line, and it is
why the tariff work in `03-pakistan/tariff-structure-current.md` matters more than the sticker
price.

Corroborating, from trade data held privately in `06-sources/`: China→Pakistan electric
two-wheelers moved at roughly **US$350 per unit FOB** in 2024, at about **95 kg per unit**.
*(UN Comtrade — local use only, not for republication.)*

## 🔴 Finding 2 — Pakistan's entry tier is priced above India's, in a poorer market

India's mainstream starts at **₹74,000**; Pakistan's at **PKR 149,900**. Without a rate the gap
cannot be quantified — but two structural facts stand regardless:

- **India's entry models undercut its own petrol equivalents more aggressively** than Pakistan's do
  against a CD 70 at PKR 159,900.
- India achieves that on a subsidy now cut to **₹5,000 a vehicle**. **Volume did not require large
  subsidy; it required scale and localisation.**

**Implication for Pakistan:** the entry tier is where volume lives, it is crowded (five brands
within PKR 15,000 of each other), and **nobody is differentiated on price.** Winning there needs a
cost structure nobody currently has — or a different business model entirely.

## Finding 3 — the premium tier is a mirage in all three markets

China tops out around **CNY 31,785**, India at **₹3.09 lakh**, Pakistan at **PKR 819,000** — each
roughly **4–8× its own market's entry price**. These are showcase products with negligible volume.
**Okla's OKG at PKR 819,000 in a market where the mass product is a CD 70 is not a business, it is
a halo.**

## 🔴 Finding 4 — the cheapest thing in this table is the newest

**Yadea's sodium-ion Q1 and DE3 at CNY 3,299–3,499** are the entry point of the world's largest
manufacturer, and they use **no lithium at all** — 92% capacity at −20°C, 80% charge in 15
minutes.

If sodium reaches export markets it **resets the cost floor** and removes lithium price and supply
risk from the bill of materials. **It is the market leader deploying it, not a startup.** This is
the most consequential product development in the entire research, and it is barely a year old.

## Finding 5 — specification quality diverges far more than price does

Within Pakistan's PKR 145,000–210,000 entry band sit **48V dry-gel packs** (Jolta JE-70D) and
lithium alternatives. Within the premium band sit **Samsung cells, ABS with EBD, IP67 and a
five-year battery warranty** (Okla OKG).

**Price bands hide a chemistry gap that decides ownership cost.** Per `02-supply/battery-layer.md`,
lead-acid dies in **12–15 months** in Pakistani conditions and **8–13 months** at fleet duty
cycles, against 3–5 years for lithium. **The cheap bike is the expensive bike** — and no
price list in any of these three markets shows that.

---

## What a fleet buyer should read from this

1. **Ignore the premium tier entirely.** It is halo product in all three markets.
2. **The entry tier is the volume, and it is where lead-acid hides.** Buying on sticker price in
   fleet service means replacing packs inside a year.
3. **The mid tier — Pakistan PKR 220,000–290,000 — is where lithium actually starts**, and lithium
   is non-negotiable at 312–500 cycles a year.
4. **The real cost lever is not the model, it is the import stack** between RMB 1,878 ex-works and
   PKR 245,000 retail. That is the margin a CKD route is competing for.

## Open items

1. **Dated FX rates**, which unlock every cross-currency comparison here.
2. **Ex-works CKD quotes at 50–200 units** — the only number that turns this into a landed-cost model.
3. **Atlas Honda Icon e pricing** — the actual competitor, still missing.
4. Model-level Chinese domestic pricing for Aima, Luyuan and Tailg.
5. Whether sodium-ion is export-available and at what price.
