-- Deploy geonames:11_add_search_indexes to pg

BEGIN;

SET search_path TO :"schema",public;

CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX idx_geoname_country_feature_code_population
ON geoname(country, feature_code, population DESC);

CREATE INDEX idx_geoname_name_trgm
ON geoname USING gin(name gin_trgm_ops);

CREATE INDEX idx_geoname_ascii_name_trgm
ON geoname USING gin(ascii_name gin_trgm_ops);

COMMIT;
