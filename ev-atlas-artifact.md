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

**Favicon: 🛵⚡** — `favicon` is a REQUIRED publish parameter and is NOT stored in
the HTML, so it cannot be recovered by reading the artifact back. 🔴 **Pass exactly this emoji on
every redeploy** — a different one changes the browser-tab icon and reads to viewers as a different
page. Learned 01-Sep-2026: a redeploy was refused with *"favicon required to publish"* and the value
had been recorded nowhere.

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

---

## 🔴 THE SHARE IS PINNED TO A VERSION — publishing alone does NOT reach viewers

**Discovered 07-Sep-2026, and it had been silently true for nine days.** The artifact's Share
panel has a **`Shared version`** control separate from `General access`. It was pinned to
**Version 1** — the original 28-Aug publish — while eighteen versions had been published.

🔴 **So every republish between 28-Aug and 07-Sep reached an audience of one: the owner.**
Viewers were reading the 28-Aug page, including figures this project later withdrew — the PAVE
two-tier subsidy correction, the "5.2× national production" retraction, the Dawn findings and the
EVE battery finding were all invisible to them. **The standing instruction *"keep upgrading the
published artifact so everyone i shared this with can see"* was structurally inert.**

**Now set to `Version 18`** (07-Sep build, the one carrying the *What changed* band).

### 🔴 THE TRAP, AND IT WILL RECUR
**There is a `Latest` option** — *"Everyone with access sees new versions as soon as you publish
them"* — and selecting it was **REFUSED** with:

> *"Can't switch to Latest while people outside your organization can open this artifact.
> Change who has access first."*

**`Latest` is mutually exclusive with `Anyone with the link`.** So while the atlas is link-shared
publicly, the shared version is a **static pin that does not advance on publish.**

⚠️ **THEREFORE: after every publish of this artifact, the shared version must be RE-PINNED by
hand, or viewers stay on the old one.** Publishing is not sharing. Re-pin as part of the same
task, and verify — the Share button's own accessible label states the state, e.g.
*"Share, shared with anyone who has the link, sharing pinned version 1"*. When no version clause
appears in that label, no pin is set.

**The choice, if this becomes tiresome:** narrow `General access` from *Anyone with the link* to
organization-only, which unlocks `Latest` and makes it self-maintaining — **but that breaks the
existing link for whoever it was shared with.** Owner's call; not made.

### How to check and set it (read-only steps are safe)
Real Chrome (`claude-in-chrome`) reaches this — **the Share menu is on the claude.ai HOST page,
not inside the cross-origin artifact iframe**, so the usual "artifacts cannot be inspected in a
browser" limitation does not apply to the sharing controls.
1. Navigate to the artifact URL · click **Share**
2. `find` the **Shared version** combobox · click it
3. **Scroll UP inside the list** — the newest version is at the top, and the list opens scrolled
   to the currently-pinned item. ⚠️ **Home/arrow keys snap back to the selected item; scrolling
   works.** ⚠️ CDP `Page.captureScreenshot` times out on this page fairly often — wait 3–4 s and
   retry rather than re-clicking.
