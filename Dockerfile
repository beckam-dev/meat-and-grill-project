FROM postgres:15
COPY db/01_create_tables.sql /docker-entrypoint-initdb.d/
