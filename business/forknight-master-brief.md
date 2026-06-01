# Forknight / Grocery Intelligence — Project Master Brief

## The Person

Cameron King. Builder-founder, digital nomad, based in Celaya, Mexico. Builds software tools for personal and family use then evaluates them for commercial potential. Supports Karen's business (The Escapepreneur / ESC Hub) but is building his own thing here. Operates lean — 1–2 people max, AI doing the heavy lifting. Profitability over scale. Wants honest assessment, not hype. Low overhead. Not a traditional developer — builds with AI assistance.

---

## What Has Been Built

**Forknight** (working title "Plonk") — a private household meal planning and grocery intelligence system built for Cameron's family of three in Celaya, Mexico.

**Tech stack:**
- Single HTML file (`dashboard.html`) — no framework, no build process
- Cloudflare Pages — auto-deploys on GitHub push (boogieking/plonk repo)
- Supabase (West US Oregon) — 8 tables, handles auth and all data
- Anthropic Claude API — via Cloudflare Worker proxy with auth guard (x-proxy-secret header)
- Open Food Facts API — barcode lookups

**Three users, three roles:**
- Cameron (admin/approver) — final say on everything, generates shopping list
- Sienna (planner) — suggests weekly meals, one reshuffle, submits for approval
- Karen (reviewer) — sees plan, can request swaps, marks meals cooked

**Core features built and working:**
- Weekly meal planning loop with approval workflow
- Smart frequency tiers based on star ratings (4.5★ = weekly, down to hibernated)
- Weighted rating system — first cook 60% weight vs 40% idea rating
- Prep timing warnings — blocks bad scheduling, suggests alternatives
- Bilingual shopping list (English/Spanish) grouped by store category
- Trolley mode — live in-store shopping with checkboxes, price entry, running MXN/USD total, receipt summary
- AI receipt scanning — photo a receipt, Claude reads every line item, matches against product DB, updates prices
- Barcode scanner — scan in-store, hits Open Food Facts, pre-fills product record
- Household Products master database — bilingual, store URLs, price history, ingredient linking
- Leftover tracking — auto-calculates surplus from receipt vs recipe needs, tracks by storage location (fridge/freezer/pantry/cupboard)
- Quick Link — maps products to recipe ingredients inline
- Find on La Comer — opens pre-searched store page, auto-pastes clipboard URL
- Dinner pairing system — 3 dinners paired per lunch, Sienna controls entirely
- Recipe steps — AI-generated or manually entered, with progress tracker
- Recipe copy/share — builds formatted text of any recipe
- Hibernation system — meals removed from rotation with wake-up timer
- Tier override — admin can lock a meal's frequency tier manually
- Karen additions — Karen can add non-meal items to shopping list
- Eating out tracking — marks days eating out, adjusts meal count needed
- Email notifications via Supabase Edge Functions
- 28 lunch recipes loaded with full metadata
- Sides library — searchable, saveable, bilingual

**What's still remaining in Forknight:**
- RLS (Row Level Security) — deliberately deferred
- WhatsApp notifications — deferred
- Dinner ingredient lists — data entry task
- Leftover-aware meal suggestions — not yet built but architecture supports it

---

## The Commercial Opportunity

**The pivot:** Forknight as-is is a private family tool. The commercial version strips La Comer hardcoding, makes stores user-configurable, and becomes a **store-agnostic household grocery intelligence platform.** Users populate their own product database through receipt scanning, barcode scanning, and trolley mode price entry. The app learns from them, not from a hardcoded store.

**The key insight:** The receipt scanner doesn't care what store printed the receipt — Claude reads any text. The barcode scanner hits Open Food Facts universally. Trolley mode works in any aisle anywhere. The only thing tying this to La Comer is the hardcoded store ID and URLs. That's a data problem, not a code problem. The pivot is smaller than it looks.

**What the commercial product actually is:**
Not a meal planner. A **household grocery intelligence system.** You scan, it learns, it saves you money. Meal planning is a feature layer on top.

---

## Three Commercial Paths Evaluated

**Path 1 — Bespoke builds**
Build custom Forknight-style systems for individual households. Project fee $1,000–2,500 + $100–150/month retainer. Realistic 3–5 clients/year. Real money, low effort, but services business with hard ceiling. Fit score 6/10.

**Path 2 — Configurable template**
Strip family-specific logic, sell as self-hosted Supabase + Cloudflare template on Gumroad/Lemon Squeezy. $79–149 one-time. 50–150 sales/year realistic. Build once, sell repeatedly. Fit score 8/10. Requires good documentation.

**Path 3 — Standalone grocery intelligence product**
The receipt scanner + price tracking + leftover system extracted and built into a proper consumer product. Store-agnostic, universally applicable. Freemium model, $6–9/month household plan. This is the primary focus. Fit score 7/10 base, higher with store-agnostic positioning.

**Decision:** Pursuing Path 3 (store-agnostic grocery intelligence) as the primary commercial direction, with Path 1 as a possible early revenue source while Path 3 develops.

---

## Business Model (Path 3)

**Free tier:** 1 store, 30 products, 4 receipt scans/month. Shows value, limits utility.

**Household plan:** $6–9/month or $59/year. Unlimited stores, products, scans. Up to 6 household members. Full meal planning layer.

**Revenue projections (revised, store-agnostic):**

| Scenario | Year 1 paying users | MRR |
|---|---|---|
| Pessimistic | 50–150 | $350–1,100 |
| Mid case | 300–600 | $2,000–4,500 |
| Optimistic | 800–1,500 | $5,500–11,000 |

These are scenario planning tools, not forecasts. Based on comparable indie SaaS patterns, not proprietary data.

---

## Data Monetisation Layer

With opted-in users scanning receipts across multiple markets, the app accumulates: product prices by store/city/country (timestamped), price change over time, basket composition, regional variation, purchase frequency, brand preference patterns.

**Who pays for this data:**
- FMCG/CPG brands (Unilever, Nestlé, P&G regional equivalents) — pricing intelligence, $5,000–20,000 per engagement at scale
- Academic researchers / universities — longitudinal household spending data, $2,000–8,000 per dataset, accessible earlier
- Government / NGOs — cost of living measurement, World Bank / IDB grant programmes
- Financial services / fintech — household spending benchmarks
- Real estate / relocation services — cost of living by city for expats and digital nomads (natural audience overlap with Cameron's network)

**The data monetisation ladder:**
- Rung 1 (0–1,000 users): No data sales. Build product, prove retention.
- Rung 2 (1,000–5,000 users, 2–3 countries): Hand-crafted anonymised reports sold directly. $2,000–5,000 per report.
- Rung 3 (5,000–20,000 users, multiple markets): Productised data API or dashboard. Real second revenue stream.
- Rung 4 (20,000+ users): Acquisition target for market research firm, fintech, or grocery platform.

**Legal requirements:** Explicit opt-in consent at signup. Never sell individual household data — aggregated anonymised only. GDPR (EU users), LFPDPPP (Mexico). Position as "contributing to cost of living research."

---

## Acquisition Scenario (Rung 4)

**Consumer app acquisition:** 3–5x ARR. At 20,000 users × $7/month = $1.68M ARR → $5M–8M acquisition value. Buyers: meal planning apps, grocery delivery platforms (Instacart, Cornershop), household management tools.

**Data asset acquisition:** 5–10x data licensing revenue. Buyers: Nielsen, IRI, Kantar, fintech, CPG intelligence platforms.

**Most likely scenario at this scale:** Micro-acquisition via Acquire.com or FE International. $800K–2M. Solo operator or small holding company buys it. Cameron exits clean or stays on short consulting contract.

**To be acquisition-ready:**
- 24+ months clean MRR history
- Churn under 5% monthly
- Documented architecture
- All accounts transferable (not tied to personal logins)
- Clean IP (no La Comer data distributed)
- Proper privacy policy and ToS
- Legal entity — company, not personal Stripe account
- Data consent records documented

---

## IP and Legal Risk Assessment

- **Open Food Facts:** ODbL licence, commercial use permitted. Zero risk.
- **La Comer product data:** Risk exists if distributed commercially. Mitigation: in any commercial version, users input their own URLs. Never distribute La Comer data. Template ships empty.
- **Supabase, Cloudflare, Anthropic APIs:** All permit commercial use. Zero risk.
- **Single HTML file architecture:** Not patentable. Zero risk.
- **Recipe content:** If Cameron's own family recipes, zero risk. Audit before distributing.

---

## What Needs to Happen Next (Priority Order)

1. **Demo video** — 60-second screen recording showing receipt scanner working. Post on Twitter/X, LinkedIn, relevant subreddits. This is the lowest-cost demand signal before any build commitment. Replies self-segment into Path 1/2/3 interest.

2. **Store-agnostic onboarding** — Replace La Comer hardcoding with user-configured store setup. "What's your main supermarket?" at signup. Estimated 20–40 hours of work.

3. **Landing page with email capture** — Headline, demo video, one question ("What supermarket do you shop at?"), email capture. 100 signups = green light to build.

4. **Pricing and payment integration** — Stripe or Lemon Squeezy. Free tier limits enforced in Supabase.

5. **Data consent layer** — Opt-in toggle at signup, privacy policy, anonymisation process.

6. **Legal entity** — Proper company structure before taking money.

---

## Validation Tests Still Pending

- Post demo video and count "where do I sign up" vs passive views
- Landing page email capture — target 100 signups before full build
- "Show HN" post describing single-file architecture + AI receipt scanning
- r/selfhosted, r/personalfinance, r/frugal posts
- DM 5 people who've complained about meal planning apps on Reddit

---

## Key Principles for This Project

- Demand validation before build commitment — always
- Revenue projections are scenario tools not forecasts
- The data is valuable only if users trust you — consent is non-negotiable
- Build acquisition-ready from day one even if you never sell
- Marketing is the risk, not the product
- The cold start problem is the biggest obstacle to Path 3 — solve it before over-engineering the data layer
- Leftover-aware meal suggestions (using what's tracked in the leftover system to influence next week's meal selection) is the feature that would make this genuinely differentiated — not yet built, should be on roadmap

---

## Open Questions Not Yet Resolved

- Does the leftover system feed back into meal suggestions? (Cameron's answer pending — this changes the product's competitive position significantly)
- What entity structure makes sense for Cameron's situation (Mexico-based, likely selling globally)?
- Which market to target first — expats, digital nomads, or general households?
- App (iOS/Android) vs PWA vs web-only for launch?
- Does Cameron want to run a consumer marketing operation or would he prefer B2B/data focus from earlier?

---

*This document reflects conversations through May 2026. Always upload the latest `dashboard.html` when starting a new session — the codebase moves fast.*