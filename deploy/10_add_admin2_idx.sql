-- Deploy geonames:10_add_admin2_idx to pg

BEGIN;

SET search_path TO :"schema";

-- remove codes that do not have a corespondence in admin2_codes
UPDATE geoname
    SET admin2_code_ref = NULL
-- select count(1)
-- from geoname
where admin2_code_ref IN (
    SELECT distinct admin2_code_ref
	FROM geoname g
    left join admin2_codes ac on admin2_code_ref = ac.code
    where 
    country IN ('US', 'GB', 'CA', 'NL', 'DE', 'CH', 'IT', 'RO')
	and ac.code is NULL
);

-- add constraint
ALTER TABLE ONLY geoname
    ADD CONSTRAINT fk_geonames_admin2_code_ref FOREIGN KEY (admin2_code_ref) REFERENCES admin2_codes(code);

CREATE INDEX idx_admin2_code_ref 
ON geoname(admin2_code_ref);

COMMIT;

-- release the space
-- https://stackoverflow.com/questions/24607548/database-size-doubles-on-update-to-single-new-column
VACUUM FULL geoname;