-- Verify geonames:geo_column on pg

BEGIN;

SET search_path TO :"schema";


SELECT the_geom from geoname
WHERE FALSE;

ROLLBACK;
