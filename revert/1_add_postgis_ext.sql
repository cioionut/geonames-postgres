-- Revert geonames:add_postgis_ext from pg

BEGIN;

DROP EXTENSION "postgis";

COMMIT;
