-- Deploy geonames:add_tables to pg

BEGIN;

-- Create syntax for TABLE geoname
CREATE TABLE geonames.geoname (
    geonameid int,
    name text,
    asciiname text,
    alternatenames text,
    latitude float,
    longitude float,
    fclass char(1),
    fcode text,
    country text,
    cc2 text,
    admin1 text,
    admin2 text,
    admin3 text,
    admin4 text,
    population bigint,
    elevation int,
    gtopo30 int,
    timezone text,
    moddate date
);

-- Create syntax for TABLE alternatename
CREATE TABLE geonames.alternatename (
    alternatenameid int,
    geonameid int,
    isolanguage text,
    alternatename text,
    ispreferredname boolean,
    isshortname boolean,
    iscolloquial boolean,
    ishistoric boolean
);

-- Create syntax for TABLE countryinfo
CREATE TABLE geonames.countryinfo (
    iso_alpha2 char(2),
    iso_alpha3 char(3),
    iso_numeric integer,
    fips_code text,
    name text,
    capital text,
    areainsqkm double precision,
    population integer,
    continent text,
    tld text,
    currencycode text,
    currencyname text,
    phone text,
    postalcodeformat text,
    postalcoderegex text,
    languages text,
    geonameid int,
    neighbors text,
    equivfipscode text
);

-- Create syntax for TABLE hierarchy
CREATE TABLE geonames.hierarchy (
    parentid int,
    childid int,
    type text
);

-- Create syntax for TABLE admin1_codes_ascii
CREATE TABLE geonames.admin1_codes_ascii (
    admin1 text,
    name text,
    asciiname text,
    geonameid int
);

-- Create syntax for TABLE admin2_codes
CREATE TABLE geonames.admin2_codes (
    admin2 text,
    name text,
    asciiname text,
    geonameid int
);

-- Create syntax for TABLE continentinfo
CREATE TABLE geonames.continentinfo (
    geonameid int,
    continent text
);

-- Create syntax for TABLE iso_language_codes
CREATE TABLE geonames.iso_language_codes (
    iso6393 text,
    iso6392 text,
    iso6391 text,
    languagename text
);

-- Create syntax for TABLE feature_codes
CREATE TABLE geonames.feature_codes (
    fclass char(1),
    fcode text,
    name text,
    description text
);

-- Create syntax for TABLE time_zones
CREATE TABLE geonames.time_zones (
  country varchar(2),
  time_zone_id text,
  GMT_offset NUMERIC(3,1),
  DST_offset NUMERIC(3,1),
  raw_offset NUMERIC(3,1)
);

-- Create syntax for TABLE postal_codes
CREATE TABLE geonames.postal_codes (
  country varchar(2),
  postal_code text,
  name text,
  admin1_name text,
  admin1_code text,
  admin2_name text,
  admin2_code text,
  admin3_name text,
  admin3_code text,
  latitude float,
  longitude float,
  accuracy int
);

COMMIT;
