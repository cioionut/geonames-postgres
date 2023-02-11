-- Verify geonames:add_tables on pg

BEGIN;
SET search_path TO :"schema";

SELECT * FROM geoname WHERE FALSE;
SELECT * FROM alternatename WHERE FALSE;
SELECT * FROM countryinfo WHERE FALSE;
SELECT * FROM hierarchy WHERE FALSE;
SELECT * FROM admin1_codes_ascii WHERE FALSE;
SELECT * FROM admin2_codes WHERE FALSE;
SELECT * FROM continentinfo WHERE FALSE;
SELECT * FROM feature_codes WHERE FALSE;
SELECT * FROM iso_language_codes WHERE FALSE;
SELECT * FROM time_zones WHERE FALSE;
SELECT * FROM postal_codes WHERE FALSE;

ROLLBACK;
