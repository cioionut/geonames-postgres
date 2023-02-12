-- Revert geonames:add_pk_hierarchy from pg

BEGIN;

SET search_path TO :"schema";

ALTER TABLE ONLY hierarchy
    DROP COLUMN id;

COMMIT;
