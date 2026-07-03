-- Sold-by-weight flag migration
-- Run this in the Supabase SQL editor

-- Marks products whose price varies by weight (deli meat, loose produce, bulk cheese, etc.)
-- so trolley mode can show a ⚖️ badge indicating the entered price is a rough estimate.
-- Defaults to false for all existing rows — tag items manually via the product admin checkbox.
ALTER TABLE household_products ADD COLUMN IF NOT EXISTS sold_by_weight boolean NOT NULL DEFAULT false;
