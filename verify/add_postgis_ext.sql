-- Verify geonames:add_postgis_ext on pg

BEGIN;

SET search_path TO :"schema";

SELECT 1/count(*) FROM pg_extension WHERE extname = 'postgis';

ROLLBACK;
