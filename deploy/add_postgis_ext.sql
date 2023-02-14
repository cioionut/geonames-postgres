-- Deploy geonames:add_postgis_ext to pg

BEGIN;

CREATE EXTENSION IF NOT EXISTS "postgis";

COMMIT;
