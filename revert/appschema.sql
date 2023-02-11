-- Revert geonames:appschema from pg

BEGIN;

DROP SCHEMA IF EXISTS :"schema";

COMMIT;
