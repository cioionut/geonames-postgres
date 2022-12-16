-- Deploy geonames:table_constraints to pg

BEGIN;

ALTER TABLE ONLY geonames.admin1_codes_ascii
    ADD CONSTRAINT pk_admin1code PRIMARY KEY (admin1);
    -- ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geonames.geoname(geonameid);

ALTER TABLE ONLY geonames.geoname
    ADD CONSTRAINT pk_geonameid PRIMARY KEY (geonameid),
    ADD CONSTRAINT fk_admin1 FOREIGN KEY (admin1) REFERENCES geonames.admin1_codes_ascii(admin1);

ALTER TABLE ONLY geonames.alternatename
    ADD CONSTRAINT pk_alternatenameid PRIMARY KEY (alternatenameid),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geonames.geoname(geonameid);

ALTER TABLE ONLY geonames.countryinfo
    ADD CONSTRAINT pk_iso_alpha2 PRIMARY KEY (iso_alpha2),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geonames.geoname(geonameid);

ALTER TABLE ONLY geonames.admin2_codes
    ADD CONSTRAINT pk_admin2code PRIMARY KEY (admin2),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geonames.geoname(geonameid);

ALTER TABLE ONLY geonames.hierarchy
    ADD CONSTRAINT pk_hierarchy PRIMARY KEY (parentid, childid),
    ADD CONSTRAINT fk_geonameid_parent FOREIGN KEY (parentid) REFERENCES geonames.geoname(geonameid),
    ADD CONSTRAINT fk_geonameid_child FOREIGN KEY (childid) REFERENCES geonames.geoname(geonameid);

ALTER TABLE ONLY geonames.continentinfo
    ADD CONSTRAINT pk_continent PRIMARY KEY (continent_code),
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geonames.geoname(geonameid);

ALTER TABLE ONLY geonames.iso_language_codes
    ADD CONSTRAINT pk_languagename PRIMARY KEY (language_name);

ALTER TABLE ONLY geonames.feature_codes
    ADD CONSTRAINT pk_featurecode PRIMARY KEY (fclass, fcode);

COMMIT;
