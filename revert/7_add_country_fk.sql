-- Revert geonames:7_add_country_fk from pg

BEGIN;

-- drop fk
ALTER TABLE ONLY geoname
    DROP CONSTRAINT fk_geonames_contry;

COMMIT;
