-- Revert geonames:geo_column from pg

BEGIN;

-- DROP INDEX idx_geoname_the_geom;

ALTER TABLE geonames.geoname 
DROP COLUMN the_geom;

COMMIT;
