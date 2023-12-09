-- Revert geonames:10_add_admin2_idx from pg

BEGIN;

DROP INDEX IF EXISTS idx_admin2_code_ref;

COMMIT;
