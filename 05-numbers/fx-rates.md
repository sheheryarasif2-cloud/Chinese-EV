# FX rates — dated, and the conversions they unblock

**Rate captured 27-Aug-2026.** Source: Forex.pk interbank page, read directly from the live
table. Page states: **"As on Thu, Aug 27 2026, 15:56 PST (GMT+5)"**.

| Currency | Bank buying (TT clean) | **Bank selling (TT & OD)** |
|---|---:|---:|
| **US Dollar USD** | 277.40 | **277.90** |
| **China Yuan CNY** | 41.26 | **41.34** |

⚠️ Forex.pk's own disclaimer: these are **indicative interbank rates**, not a dealing rate and
not an SBP publication. An importer pays the **selling** rate plus the bank's spread, so every
conversion below uses **USD 277.90 / CNY 41.34** — the conservative side.

🔴 **This is the first dated rate in the project.** Every `[PLACEHOLDER: rate + date]` in the
model files was blocked on it. **Re-date it before it is used for anything binding** — PKR has
no stability guarantee and the whole import case is exposed to it.

---

## 🔴 What it reveals: the multiple from factory gate to Pakistani retail is 3.3×

Yadea's **audited** FY2025 ex-works ASP, converted at CNY 41.34:

| | RMB | **PKR** |
|---|---:|---:|
| **Electric bicycle** ex-works | 1,415 | **58,496** |
| **Electric scooter** ex-works | 1,878 | **77,636** |

Set that against the Pakistani retail ladder already recorded:

| | PKR | Multiple of ex-works scooter |
|---|---:|---:|
| **Yadea ex-works ASP (audited)** | **77,636** | **1.0×** |
| Cheapest Pakistani e-bike (Evee Flipper) | 97,000 | 1.2× |
| Pakistani volume band | 150,000 – 250,000 | 1.9 – 3.2× |
| **Yadea T5 in Pakistan** | **253,500** | **3.3×** |
| Honda ICON e: | 419,900 | 5.4× |

**A Yadea sold in Pakistan retails at roughly 3.3× what Yadea's own audited accounts say it
leaves the factory for.** That entire multiple is freight, duty, sales tax, withholding,
clearing, assembly and distribution margin — and it is the whole opportunity and the whole
tariff exposure in one number.

## And China's own retail already sits inside Pakistan's volume band

| Chinese domestic retail | CNY | **PKR @ 41.34** |
|---|---:|---:|
| Tailg promotional (1200W, 60 km) | 2,999 | **123,978** |
| **Yadea Q1 / DE3 — sodium-ion** | 3,299 – 3,499 | **136,380 – 144,648** |
| Tailg M6 (600W, 80 km+) | 3,899 | **161,184** |
| Yadea G6 / T9 | 12,285 – 12,994 | 507,862 – 537,171 |

🔴 **China's mainstream retail (PKR 124,000–161,000) lands *inside* Pakistan's volume band
(PKR 150,000–250,000) and well *below* the Yadea T5's PKR 253,500** — and that Chinese price
already carries Chinese distribution margin.

**Read plainly: Pakistani buyers pay a large premium over Chinese buyers for the same class of
machine.** That premium is the importable margin. It is also exactly what a domestic assembler
with the 1% CKD rate is positioned to compete away — which is the competitive risk, not just
the opportunity.

## Rates still needed

1. **INR/PKR** — to make the India price list comparable. Not captured; Forex.pk lists it.
2. **A dealing rate, not an indicative one** — the spread a bank actually quotes on an LC.
3. **The forward rate**, if any bank will quote one. An import business with a 25–35 day sea
   leg carries FX risk across the whole voyage.
