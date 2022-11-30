-- Deploy geonames:geo_column to pg

BEGIN;

ALTER TABLE geonames.geoname 
ADD COLUMN the_geom geometry(Point, 4326);

UPDATE geonames.geoname SET the_geom = ST_PointFromText('POINT(' || longitude ||
' ' || latitude || ')', 4326);
CREATE INDEX idx_geoname_the_geom ON geonames.geoname USING gist(the_geom);

COMMIT;
