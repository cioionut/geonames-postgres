-- Deploy geonames:add_admin1_fk to pg

BEGIN;

SET search_path TO :"schema";

-- add column
ALTER TABLE geoname
    ADD COLUMN admin1_code_ref CHAR(20);

UPDATE geoname
    SET admin1_code_ref = country || '.' || admin1
WHERE admin1 != '00' AND country IN ('RO', 'CA');

-- add constraint
ALTER TABLE ONLY geoname
    ADD CONSTRAINT fk_geonames_admin1_code_ref FOREIGN KEY (admin1_code_ref) REFERENCES admin1_codes(code);


COMMIT;
