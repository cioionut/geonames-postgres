-- Deploy geonames:9_add_admin2_fk to pg

BEGIN;

SET search_path TO :"schema";

-- add column
ALTER TABLE geoname
    ADD COLUMN admin2_code_ref TEXT;

-- add values
UPDATE geoname
    SET admin2_code_ref = country || '.' || admin1 || '.' || admin2
WHERE admin1 != '00' and admin2 != '00' AND country IN ('US', 'GB', 'CA', 'NL', 'DE', 'CH', 'IT', 'RO')
AND country || '.' || admin1 || '.' || admin2 NOT IN (
    SELECT distinct (g.country || '.' || g.admin1 || '.' || g.admin2) FROM public.geoname g
    left join public.admin2_codes ac on g.country || '.' || g.admin1 || '.' || g.admin2 = ac.code
    where 
    country IN (
        'US',
        'GB',
        'CA', 'NL', 'DE', 'CH', 'IT', 'RO'
    ) and
    g.admin1 != '00' and
    g.admin2 != '00' and
    ac.code is NULL
);

-- add constraint
ALTER TABLE ONLY geoname
    ADD CONSTRAINT fk_geonames_admin2_code_ref FOREIGN KEY (admin2_code_ref) REFERENCES admin2_codes(code);


COMMIT;
