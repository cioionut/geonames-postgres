-- Revert geonames:add_admin1_fk from pg

BEGIN;

SET search_path TO :"schema";

ALTER TABLE ONLY geoname
    DROP COLUMN admin1_code_ref;

-- drop fk
-- ALTER TABLE ONLY geoname
--     DROP CONSTRAINT fk_geonames_admin1_code;


COMMIT;
