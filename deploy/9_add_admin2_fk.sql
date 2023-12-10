-- Deploy geonames:9_add_admin2_fk to pg

BEGIN;

SET search_path TO :"schema";

-- add column
ALTER TABLE geoname
    ADD COLUMN admin2_code_ref TEXT;

-- add values
UPDATE geoname
    SET admin2_code_ref = admin1_code_ref || '.' || admin2
WHERE admin1_code_ref is not NULL;

COMMIT;
