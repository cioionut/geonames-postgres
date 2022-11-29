-- Revert geonames:appschema from pg

BEGIN;

DROP SCHEMA geonames;

COMMIT;
