-- Deploy geonames:geo_column to pg

BEGIN;

ALTER TABLE geoname 
ADD COLUMN the_geom geometry(Point, 4326);

UPDATE geoname SET the_geom = ST_PointFromText('POINT(' || longitude ||
' ' || latitude || ')', 4326);
CREATE INDEX idx_geoname_the_geom ON geoname USING gist(the_geom);

COMMIT;
