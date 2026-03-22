-- Revert geonames:11_add_search_indexes from pg

BEGIN;

SET search_path TO :"schema",public;

DROP INDEX IF EXISTS idx_geoname_ascii_name_trgm;
DROP INDEX IF EXISTS idx_geoname_name_trgm;
DROP INDEX IF EXISTS idx_geoname_country_feature_code_population;

COMMIT;
