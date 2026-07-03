-- Guest headcount migration
-- Run this in the Supabase SQL editor

-- Adds a per-meal-assignment guest headcount so shopping list quantities can be
-- scaled up or down from the household baseline of 3 people. Set when a meal is
-- scheduled to a day; defaults to 3 (the baseline) for all existing rows.
ALTER TABLE weekly_plan_meals ADD COLUMN IF NOT EXISTS guest_count integer NOT NULL DEFAULT 3;
