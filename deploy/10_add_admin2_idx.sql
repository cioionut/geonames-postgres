-- Deploy geonames:10_add_admin2_idx to pg

BEGIN;

CREATE INDEX idx_admin2_code_ref 
ON geoname(admin2_code_ref);

COMMIT;
