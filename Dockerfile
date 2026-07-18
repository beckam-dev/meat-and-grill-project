FROM postgres:18
COPY db/01_create_tables.sql /docker-entrypoint-initdb.d/
