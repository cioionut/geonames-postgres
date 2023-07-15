# How do deploy
1. Run `./import.sh -g` from `geonames_pg_import` to download the geonames data
2. `sqitch deploy 2_add_tables`
3. Run `./import.sh -i` from `geonames_pg_import`
4. `sqitch deploy 6_add_admin1_fk`


## Setup .pgpass file
- https://www.postgresql.org/docs/current/libpq-pgpass.html
- https://tableplus.com/blog/2019/09/how-to-use-pgpass-in-postgresql.html

# Sqitch

## Manage Secrets
- https://github.com/sqitchers/sqitch/blob/develop/lib/sqitch-passwords.pod
- https://metacpan.org/pod/sqitch-authentication

## Postgres Tutorial
- https://sqitch.org/docs/manual/sqitchtutorial/

# Inspiration
- https://github.com/cioionut/geonames_pg_import
- https://event.ifi.uni-heidelberg.de/wp-content/uploads/2017/03/geonames_installation.pdf
- https://github.com/swidz/GeoNames-PostgreSQL-DataImport

# Disk Usage
- https://wiki.postgresql.org/wiki/Disk_Usage

# sqitch commands
- `sqitch deploy table_constraints`


# DEBUG
## Spot not present foreign key in the admin1_codes table
```sql
SELECT distinct g.admin1 FROM public.geoname g
left join public.admin1_codes ac on g.country || '.' || g.admin1 = ac.code
where 
country = 'GB' and (g.admin1 != '00') and ac.code is NULL
```