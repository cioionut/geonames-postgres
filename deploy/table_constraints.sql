-- Deploy geonames:table_constraints to pg

BEGIN;

SET search_path TO :"schema";

ALTER TABLE ONLY admin1_codes_ascii
    ADD CONSTRAINT pk_admin1code PRIMARY KEY (admin1);
    -- ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);

ALTER TABLE ONLY geoname
    ADD CONSTRAINT pk_geonameid PRIMARY KEY (geonameid),
    ADD CONSTRAINT fk_admin1 FOREIGN KEY (admin1) REFERENCES admin1_codes_ascii(admin1);

ALTER TABLE ONLY alternatename
    ADD CONSTRAINT pk_alternatenameid PRIMARY KEY (alternatenameid),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);

ALTER TABLE ONLY countryinfo
    ADD CONSTRAINT pk_iso_alpha2 PRIMARY KEY (iso_alpha2),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);

ALTER TABLE ONLY admin2_codes
    ADD CONSTRAINT pk_admin2code PRIMARY KEY (admin2),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);

ALTER TABLE ONLY hierarchy
    ADD CONSTRAINT pk_hierarchy PRIMARY KEY (parentid, childid),
    ADD CONSTRAINT fk_geonameid_parent FOREIGN KEY (parentid) REFERENCES geoname(geonameid),
    ADD CONSTRAINT fk_geonameid_child FOREIGN KEY (childid) REFERENCES geoname(geonameid);

ALTER TABLE ONLY continentinfo
    ADD CONSTRAINT pk_continent PRIMARY KEY (continent_code),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);

ALTER TABLE ONLY iso_language_codes
    ADD CONSTRAINT pk_languagename PRIMARY KEY (language_name);

ALTER TABLE ONLY feature_codes
    ADD CONSTRAINT pk_featurecode PRIMARY KEY (fclass, fcode);

COMMIT;
