# How do deploy
1. Edit `./geonames_importer.sh` from geonames postgres importer project
2. Run `./geonames_importer.sh -a download-data`
3. `sqitch deploy add_tables`
4. Run `./geonames_importer.sh -a import-dumps`
5. Run `./geonames_importer.sh -a edit-entries`
6. [Optional] Run `./geonames_importer.sh -a delete-entries` if a subset of countries was initially imported
7. `sqitch deploy table_constraints`



## Setup .pgpass file
- https://tableplus.com/blog/2019/09/how-to-use-pgpass-in-postgresql.html

# Sqitch Postgres Tutorial
- https://sqitch.org/docs/manual/sqitchtutorial/

# Inspiration
- https://event.ifi.uni-heidelberg.de/wp-content/uploads/2017/03/geonames_installation.pdf
- https://github.com/swidz/GeoNames-PostgreSQL-DataImport

# Disk Usage
- https://wiki.postgresql.org/wiki/Disk_Usage

# sqitch commands
- `sqitch deploy table_constraints`