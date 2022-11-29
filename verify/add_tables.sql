-- Verify geonames:add_tables on pg

BEGIN;

SELECT * FROM geonames.geoname WHERE FALSE;
SELECT * FROM geonames.alternatename WHERE FALSE;
SELECT * FROM geonames.countryinfo WHERE FALSE;
SELECT * FROM geonames.hierarchy WHERE FALSE;
SELECT * FROM geonames.admin1_codes_ascii WHERE FALSE;
SELECT * FROM geonames.admin2_codes WHERE FALSE;
SELECT * FROM geonames.continentinfo WHERE FALSE;
SELECT * FROM geonames.feature_codes WHERE FALSE;
SELECT * FROM geonames.iso_language_codes WHERE FALSE;
SELECT * FROM geonames.time_zones WHERE FALSE;
SELECT * FROM geonames.postal_codes WHERE FALSE;

ROLLBACK;
