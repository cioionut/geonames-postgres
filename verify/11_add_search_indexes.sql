-- Verify geonames:11_add_search_indexes on pg

BEGIN;

DO $$
BEGIN
  IF (
    SELECT COUNT(*)
    FROM pg_indexes
    WHERE schemaname = 'public'
      AND tablename = 'geoname'
      AND indexname IN (
        'idx_geoname_country_feature_code_population',
        'idx_geoname_name_trgm',
        'idx_geoname_ascii_name_trgm'
      )
  ) <> 3 THEN
    RAISE EXCEPTION 'Expected 3 geoname search indexes in public schema';
  END IF;
END $$;

ROLLBACK;
