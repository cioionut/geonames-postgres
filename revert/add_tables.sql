-- Revert geonames:add_tables from pg

BEGIN;


DROP TABLE IF EXISTS geonames.geoname CASCADE;
DROP TABLE IF EXISTS geonames.alternatename CASCADE;
DROP TABLE IF EXISTS geonames.countryinfo CASCADE;
DROP TABLE IF EXISTS geonames.hierarchy CASCADE;
DROP TABLE IF EXISTS geonames.admin1_codes_ascii CASCADE;
DROP TABLE IF EXISTS geonames.admin2_codes CASCADE;
DROP TABLE IF EXISTS geonames.continentinfo CASCADE;
DROP TABLE IF EXISTS geonames.feature_codes CASCADE;
DROP TABLE IF EXISTS geonames.iso_language_codes CASCADE;
DROP TABLE IF EXISTS geonames.time_zones CASCADE;
DROP TABLE IF EXISTS geonames.postal_codes CASCADE;

COMMIT;
