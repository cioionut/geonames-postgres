-- Verify geonames:add_postgis_ext on pg

BEGIN;

SELECT 1/count(*) FROM pg_extension WHERE extname = 'postgis';

ROLLBACK;
