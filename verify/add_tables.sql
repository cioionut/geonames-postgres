-- Verify geonames:add_tables on pg

BEGIN;
SET search_path TO :"schema";

SELECT * FROM geoname WHERE FALSE;
SELECT * FROM hierarchy WHERE FALSE;
SELECT * FROM alternate_names WHERE FALSE;
SELECT * FROM country_info WHERE FALSE;
SELECT * FROM iso_language_codes WHERE FALSE;
SELECT * FROM admin1_codes WHERE FALSE;
SELECT * FROM admin2_codes WHERE FALSE;
SELECT * FROM admin5_codes WHERE FALSE;
SELECT * FROM feature_codes WHERE FALSE;
SELECT * FROM time_zones WHERE FALSE;
SELECT * FROM postal_codes WHERE FALSE;
SELECT * FROM continent_codes WHERE FALSE;

ROLLBACK;
