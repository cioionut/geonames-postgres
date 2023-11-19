-- Deploy geonames:7_add_country_fk to pg

BEGIN;

SET search_path TO :"schema";

-- add constraint
ALTER TABLE ONLY geoname
    ADD CONSTRAINT fk_geonames_contry FOREIGN KEY (country) REFERENCES country_info(iso_alpha2);


COMMIT;
