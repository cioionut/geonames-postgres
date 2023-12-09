-- Revert geonames:9_add_admin2_fk from pg

BEGIN;

SET search_path TO :"schema";

ALTER TABLE ONLY geoname
    DROP COLUMN admin2_code_ref;

-- drop fk
-- ALTER TABLE ONLY geoname
--     DROP CONSTRAINT fk_geonames_admin2_code_ref;

COMMIT;
