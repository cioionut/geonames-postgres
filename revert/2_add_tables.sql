-- Revert geonames:add_tables from pg

BEGIN;
SET search_path TO :"schema";

DROP TABLE IF EXISTS geoname CASCADE;
DROP TABLE IF EXISTS hierarchy;
DROP TABLE IF EXISTS alternate_names;
DROP TABLE IF EXISTS country_info;
DROP TABLE IF EXISTS iso_language_codes;
DROP TABLE IF EXISTS admin1_codes;
DROP TABLE IF EXISTS admin2_codes;
DROP TABLE IF EXISTS admin5_codes;
DROP TABLE IF EXISTS feature_codes;
DROP TABLE IF EXISTS time_zones;
DROP TABLE IF EXISTS postal_codes;
DROP TABLE IF EXISTS continent_codes;

COMMIT;
