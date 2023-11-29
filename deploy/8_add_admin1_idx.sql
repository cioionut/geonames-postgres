-- Deploy geonames:8_add_admin1_idx to pg

BEGIN;

CREATE INDEX idx_admin1_code_ref 
ON geoname(admin1_code_ref);

COMMIT;
