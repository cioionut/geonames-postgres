-- Revert geonames:add_postgis_ext from pg

BEGIN;

SET search_path TO :"schema";

DROP EXTENSION "postgis";

COMMIT;
