-- Verify geonames:appschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('geonames', 'usage');

ROLLBACK;
