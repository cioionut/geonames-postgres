-- Revert geonames:table_constraints from pg

BEGIN;

SET search_path TO :"schema";

DROP INDEX index_alternate_names_geoname_id;
ALTER TABLE ONLY alternate_names
    DROP CONSTRAINT pk_alternate_name_id,
    DROP CONSTRAINT fk_alternate_names_geoname_id;

DROP INDEX index_country_info_geoname_id;
ALTER TABLE ONLY country_info
    DROP CONSTRAINT pk_iso_alpha2,
    DROP CONSTRAINT fk_country_info_geoname_id,
    DROP COLUMN flag;

DROP INDEX index_admin1_codes_geoname_id;
ALTER TABLE ONLY admin1_codes
    DROP CONSTRAINT pk_admin1_code,
    DROP CONSTRAINT fk_admin1_codes_geoname_id;

DROP INDEX index_admin2_codes_geoname_id;
ALTER TABLE ONLY admin2_codes
    DROP CONSTRAINT pk_admin2_code,
    DROP CONSTRAINT fk_admin2_codes_geoname_id;

ALTER TABLE ONLY admin5_codes
    DROP CONSTRAINT pk_admin5_geoname_id,
    DROP CONSTRAINT fk_admin5_codes_geoname_id;

DROP INDEX index_hierarchy_parent_id;
DROP INDEX index_hierarchy_child_id;
ALTER TABLE ONLY hierarchy
    DROP CONSTRAINT fk_hierarchy_geoname_parent_id,
    DROP CONSTRAINT fk_hierarchy_geoname_child_id;

ALTER TABLE ONLY continent_codes
    DROP CONSTRAINT pk_continent_code;

-- ALTER TABLE ONLY iso_language_codes
--     DROP CONSTRAINT pk_languagename;

ALTER TABLE ONLY feature_codes
    DROP CONSTRAINT pk_feature_code;

ALTER TABLE ONLY postal_codes
    DROP CONSTRAINT pk_postal_code;

ALTER TABLE time_zones
    DROP CONSTRAINT pk_time_zone_id;

-- geoname
ALTER TABLE ONLY geoname
    DROP CONSTRAINT pk_geoname_id;

COMMIT;
