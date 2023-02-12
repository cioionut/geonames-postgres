-- Deploy geonames:add_postgis_ext to pg

BEGIN;

SET search_path TO :"schema";

CREATE EXTENSION IF NOT EXISTS "postgis";

COMMIT;
