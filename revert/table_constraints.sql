-- Revert geonames:table_constraints from pg

BEGIN;

ALTER TABLE ONLY geonames.alternatename
    DROP CONSTRAINT pk_alternatenameid,
    DROP CONSTRAINT fk_geonameid;

ALTER TABLE ONLY geonames.countryinfo
    DROP CONSTRAINT pk_iso_alpha2,
    DROP CONSTRAINT fk_geonameid;

ALTER TABLE ONLY geonames.admin1_codes_ascii
    DROP CONSTRAINT pk_admin1code,
    DROP CONSTRAINT fk_geonameid;

ALTER TABLE ONLY geonames.admin2_codes
    DROP CONSTRAINT pk_admin2code,
    DROP CONSTRAINT fk_geonameid;

ALTER TABLE ONLY geonames.hierarchy
    DROP CONSTRAINT fk_geonameid_parent,
    DROP CONSTRAINT fk_geonameid_child;

ALTER TABLE ONLY geonames.continentinfo
    DROP CONSTRAINT pk_continent,
    DROP CONSTRAINT fk_geonameid;

ALTER TABLE ONLY geonames.iso_language_codes
    DROP CONSTRAINT pk_languagename;

ALTER TABLE ONLY geonames.feature_codes
    DROP CONSTRAINT pk_featurecode;

-- geoname
ALTER TABLE ONLY geonames.geoname
    DROP CONSTRAINT pk_geonameid;

COMMIT;
