-- Deploy geonames:geo_column to pg

BEGIN;

SET search_path TO :"schema",public;

-- needs pg_trgm extension
-- see https://github.com/PostgresApp/PostgresApp/issues/335#issuecomment-304163489
-- -- Should be ran after data import
-- ALTER TABLE geoname
--     ADD COLUMN search_vector tsvector
--         GENERATED ALWAYS AS (
--             to_tsvector('english',
--                 coalesce(name, '') || ' ' || coalesce(ascii_name, '') || ' ' || coalesce(alternate_names, '')
--             )
--         ) STORED;

-- CREATE INDEX geoname_search_vector_idx
--     ON geoname USING gin (search_vector);

-- -- Index for similarity comparisons
-- CREATE INDEX geoname_ascii_name_trgm_idx
--     ON geoname USING gin (ascii_name gin_trgm_ops);

-- Geometry Point
ALTER TABLE geoname
    ADD COLUMN the_geom geometry(Point, 4326)
        GENERATED ALWAYS AS (
            ST_Point(longitude, latitude, 4326)
        ) STORED;

CREATE INDEX geoname_geom_idx
    ON geoname USING gist(the_geom);

COMMIT;

-- release the space
-- https://stackoverflow.com/questions/24607548/database-size-doubles-on-update-to-single-new-column
VACUUM FULL geoname;