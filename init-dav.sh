psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER solyto_dav WITH PASSWORD '$DAV_DB_PASSWORD';
    CREATE DATABASE solyto_dav OWNER solyto_dav;
EOSQL