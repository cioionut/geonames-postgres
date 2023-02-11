-- Deploy geonames:add_tables to pg

BEGIN;
SET search_path TO :"schema";

-- Create syntax for TABLE geoname
CREATE TABLE geoname (
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
CREATE TABLE alternatename (
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
CREATE TABLE countryinfo (
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
CREATE TABLE hierarchy (
    parentid int,
    childid int,
    type text
);

-- Create syntax for TABLE admin1_codes_ascii
CREATE TABLE admin1_codes_ascii (
    admin1 text,
    name text,
    asciiname text,
    geonameid int
);

-- Create syntax for TABLE admin2_codes
CREATE TABLE admin2_codes (
    admin2 text,
    name text,
    asciiname text,
    geonameid int
);

-- Create syntax for TABLE continentinfo
CREATE TABLE continentinfo (
    continent_code char(2),
    geonameid int,
    name text
);

-- Create syntax for TABLE iso_language_codes
CREATE TABLE iso_language_codes (
    iso_639_3 text,
    iso_639_2 text,
    iso_639_1 text,
    language_name text
);

-- Create syntax for TABLE feature_codes
CREATE TABLE feature_codes (
    fclass char(1),
    fcode text,
    name text,
    description text
);

-- Create syntax for TABLE time_zones
CREATE TABLE time_zones (
  country varchar(2),
  time_zone_id text,
  GMT_offset NUMERIC(3,1),
  DST_offset NUMERIC(3,1),
  raw_offset NUMERIC(3,1)
);

-- Create syntax for TABLE postal_codes
CREATE TABLE postal_codes (
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
