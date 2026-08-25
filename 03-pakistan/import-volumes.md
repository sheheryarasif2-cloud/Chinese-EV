# China → Pakistan electric two-wheeler imports

**Recorded 25-Aug-2026.** First sourced dataset in this project.

## Source

UN Comtrade public preview API, retrieved 25-Aug-2026. Raw responses for every year saved at
`06-sources/uncomtrade-hs871160-china-to-pakistan.json` — including the exact URLs, so any
figure here can be re-checked.

- **Reporter:** China (156) · **Partner:** Pakistan (586) · **Flow:** exports (X) · **Annual**
- **Commodity: HS 871160** — *"Motorcycles (including mopeds) and cycles; fitted with auxiliary
  motor, with electric motor for propulsion, with or without side-cars; side-cars."*
  Code definition confirmed from the API, not assumed.
- Every year flagged `isReported: true` — directly reported by China, not estimated.
- Figures obtained twice by independent paths — through the `un-comtrade` MCP tool and by
  direct HTTP call — and they match exactly.

🔴 **UN Comtrade prohibits redistribution of this data. Local use only.** It may live in this
private repo. It must **not** go into a public artifact, a shared page, or anything published.

## The series

| Year | Units | US$ FOB | US$/unit | kg/unit |
|---:|---:|---:|---:|---:|
| 2019 | 2,178 | 263,945 | 121 | 39.8 |
| 2020 | 888 | 97,471 | 110 | 30.9 |
| 2021 | 1,887 | 317,067 | 168 | 42.9 |
| 2022 | 4,914 | 2,212,073 | 450 | 72.9 |
| 2023 | 23,509 | 5,772,783 | 246 | 61.1 |
| 2024 | **46,716** | **16,344,560** | 350 | 94.7 |
| 2025 | *not yet reported* | | | |

## What it says

- **The lane is real and it is growing hard.** 888 units in 2020 to 46,716 in 2024 — roughly
  53×. From 2023 to 2024 units doubled while value nearly tripled.
- **The goods are getting heavier, and that is the most informative column here.** 30.9 kg per
  unit in 2020 to 94.7 kg in 2024. A ~31 kg machine is an electric bicycle. A ~95 kg machine is
  a scooter or motorcycle. **The mix has shifted out of the bicycle class and into the segment
  this project is actually about** — and it did so recently.
- **They remain cheap.** US$350 FOB in 2024. Even after freight, duty and margin, this is a
  low-price product competing against the 70cc commuter, not a premium one.

## What it does not say

- 🔴 **HS 871160 mixes segments.** It covers pedal cycles with auxiliary motors *and* electric
  motorcycles. The weight trend is the best available proxy for the mix — it is **not** a
  segmentation, and it cannot be split further from this source. Any claim that "X units of
  electric motorcycles" entered Pakistan is an over-read of this data.
- **These are China's reported exports.** Pakistan's reported imports are a separate series and
  will disagree. Pull it before relying on either. **Never average two mirror figures** — record
  both and say which is better evidenced.
- **FOB excludes freight, insurance, duty and taxes.** It is the starting line of a landed-cost
  model, not a price.
- **No company-level detail.** Comtrade is country-to-country only. Which exporter shipped to
  which Pakistani importer sits behind the paid services that were deliberately deferred.
- **2025 is absent** — not zero, simply not reported yet. Do not read the blank as a decline.

## What it changes for the kill criteria

- **K9 (breakeven volume) now has a denominator.** The entire China→Pakistan lane was 46,716
  units in 2024. Any entry takes a share of that or grows it. Once K6 gives a per-unit margin,
  the required share becomes arithmetic rather than opinion.
- **K11 (defensible position) gets harder, not easier.** A lane doubling year-on-year attracts
  entrants. Whoever imported those 46,716 units already exists, already has channel, and is the
  competition. **Identifying them is now the most valuable open question in the project.**
- **K6 has an anchor.** US$350 FOB is the starting figure for the landed-cost stack. The PKR
  equivalent needs a rate and a date — `[PLACEHOLDER: USD/PKR rate + date]`. It is not written
  here because an undated conversion is not a figure.

## Open questions this raises

1. Pakistan's mirror import series for the same code — does it agree?
2. What is the 94.7 kg average actually made of? Model-level evidence is needed.
3. Who are the Pakistani importers behind these volumes?
4. How does 46,716 compare with total Pakistani motorcycle sales? Without that denominator,
   "growing fast" has no scale.
