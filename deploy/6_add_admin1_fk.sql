-- Deploy geonames:add_admin1_fk to pg

BEGIN;

SET search_path TO :"schema";

-- add column
ALTER TABLE geoname
    ADD COLUMN admin1_code_ref CHAR(20);


-- build admin1 code column
-- special case UK: fix: Key (admin1_code_ref)=(GB.05) is not present in table "admin1_codes".
UPDATE geoname
    SET admin1_code_ref = country || '.' || admin1
WHERE admin1 NOT IN ('00', '01', '03', '05') AND country = 'GB';

-- other cases
UPDATE geoname
    SET admin1_code_ref = country || '.' || admin1
WHERE admin1 != '00' AND country IN (
    'US',
    'CA',
    'NL',
    'DE',
    'CH',
    'IT',
    'RO');

-- add constraint
ALTER TABLE ONLY geoname
    ADD CONSTRAINT fk_geonames_admin1_code_ref FOREIGN KEY (admin1_code_ref) REFERENCES admin1_codes(code);


COMMIT;
