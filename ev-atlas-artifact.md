---
name: ev-atlas-artifact
description: The published Three-Market EV Atlas artifact — its URL, that it is SHARED, and the rule to always update it in place
metadata:
  type: project
---

🔴 **The EV Atlas is PUBLISHED AND SHARED WITH OTHER PEOPLE.**

**URL — always reuse this one:**
`https://claude.ai/code/artifact/cbab7218-7f8b-4e2e-865e-3d4713b846d4`

**Source file:** `C:\Users\ESHOP\Documents\Chinese-EV-Research\ev-atlas.html`

🔴 **Standing instruction from Sheheryar (28-Aug-2026): "keep upgrading the published artifact from
now on, so everyone i shared this with can see."** Every new research finding goes into this
artifact, not only into the markdown files.

**How to update without breaking the share:**
- **Republish the SAME `file_path`.** That keeps the URL, and everyone already shared with sees the
  new version.
- From a **different conversation**, pass `url:` explicitly — publishing without it creates a
  SEPARATE artifact and the shared link goes stale.

⚠️ **The model table is PRE-RENDERED into the source on purpose.** 147 rows are baked into
`<tbody id="mb">` as static HTML so the vehicle lists are visible **even if the JS does not run** in
the artifact frame. **After any change to the model data, re-bake it:** headless Chrome
`--dump-dom`, extract `<tbody id="mb">…</tbody>`, inject it back. Bake the DEFAULT view (147, with
discontinued hidden) so there is no content jump when the JS takes over.

⚠️ **A published artifact CANNOT be inspected from either browser** — it renders in a cross-origin
frame and `javascript_tool` throws SecurityError. **Verify against the LOCAL file with headless
Chrome, before publishing.** WebFetch on the artifact URL returns the raw source only, which cannot
tell you whether JS-rendered content populated.

**Chart palette is validated, not chosen by eye** — China `#B07208`, India `#6C46AD`,
Pakistan `#0F7D4C` (light); `#B8822A` / `#9A7ACE` / `#2FA26E` (dark). Three earlier triads FAILED
CVD separation (green↔amber ΔE 5.9 protan). **Re-run `dataviz/scripts/validate_palette.js` before
changing any series colour.**
