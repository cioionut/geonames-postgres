-- Verify geonames:geo_column on pg

BEGIN;

SELECT the_geom from geonames.geoname
WHERE FALSE;

ROLLBACK;
