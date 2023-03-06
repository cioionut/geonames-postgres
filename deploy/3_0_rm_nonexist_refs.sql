-- Deploy geonames:3_0_rm_nonexist_refs to pg

BEGIN;

SET search_path TO :"schema";

-- clean hierarchy
-- remove not present parent_id
DELETE FROM hierarchy as tab
WHERE tab.parent_id IN (
    select ci.parent_id from hierarchy as ci
    left join geoname as gn on gn.id = ci.parent_id
    where gn.id is null
);

DELETE FROM hierarchy as tab
WHERE tab.child_id IN (
    select ci.child_id from hierarchy as ci
    left join geoname as gn on gn.id = ci.child_id
    where gn.id is null
);

-- clean country_info
-- set null for countries where geoname is not available
UPDATE country_info
	SET geoname_id = NULL
WHERE geoname_id IN (
	select ci.geoname_id from country_info as ci
    left join geoname as gn on gn.id = ci.geoname_id
    where gn.id is null
);

-- clean admin1_codes
UPDATE admin1_codes
	SET geoname_id = NULL
WHERE geoname_id IN (
    select ci.geoname_id from admin1_codes as ci
    left join geoname as gn on gn.id = ci.geoname_id
    where gn.id is null
);

-- clean admin2_codes
DELETE FROM admin2_codes as tab
WHERE tab.geoname_id IN (
    select ci.geoname_id from admin2_codes as ci
    left join geoname as gn on gn.id = ci.geoname_id
    where gn.id is null
);

-- clean admin5_codes
DELETE FROM admin5_codes as tab
WHERE tab.geoname_id IN (
    select ci.geoname_id from admin5_codes as ci
    left join geoname as gn on gn.id = ci.geoname_id
    where gn.id is null
);


-- remove duplicates

DELETE FROM postal_codes p1 USING postal_codes p2
WHERE p1.ctid > p2.ctid
  AND p2.country_code = p1.country_code
  AND p2.postal_code = p1.postal_code
  AND p2.place_name = p1.place_name;

DELETE FROM postal_codes
WHERE place_name is null;

COMMIT;
