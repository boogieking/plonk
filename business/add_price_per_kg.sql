-- Per-kg price tracking migration (Part 2 of weight-based item price tracking)
-- Run this in the Supabase SQL editor

-- For sold_by_weight items, price_history.price_mxn now stores the per-kg price
-- (not the total paid). quantity_kg records how much was bought that trip.
-- price_per_kg duplicates the per-kg rate for convenient querying.
ALTER TABLE price_history ADD COLUMN IF NOT EXISTS quantity_kg numeric;
ALTER TABLE price_history ADD COLUMN IF NOT EXISTS price_per_kg numeric;
