-- Budget tracker migration
-- Run this in the Supabase SQL editor

-- Table to store each completed trolley/shopping session
CREATE TABLE IF NOT EXISTS shopping_trips (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  trip_date   date NOT NULL DEFAULT CURRENT_DATE,
  total_mxn   numeric(10,2) NOT NULL,
  total_usd   numeric(10,2),
  plan_id     uuid REFERENCES weekly_plans(id) ON DELETE SET NULL,
  recorded_by uuid REFERENCES users(id) ON DELETE SET NULL,
  created_at  timestamptz NOT NULL DEFAULT now()
);

-- Index for date range queries (weekly/monthly lookups)
CREATE INDEX IF NOT EXISTS shopping_trips_trip_date_idx ON shopping_trips(trip_date);

-- Budget settings are stored in the existing app_settings table as:
--   key = 'weekly_budget_mxn',  value = '2000'
--   key = 'monthly_budget_mxn', value = '8000'
-- No schema change needed — app_settings already handles arbitrary key/value pairs.
