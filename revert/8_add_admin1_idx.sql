-- Revert geonames:8_add_admin1_idx from pg

BEGIN;

DROP INDEX IF EXISTS idx_admin1_code_ref;

COMMIT;
