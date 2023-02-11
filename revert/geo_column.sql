-- Revert geonames:geo_column from pg

BEGIN;

SET search_path TO :"schema";

-- DROP INDEX idx_geoname_the_geom;

ALTER TABLE geoname 
DROP COLUMN the_geom;

COMMIT;
