# Smart home

# Smart Home Backend

## 📌 Setup the database
To setup the PostgreSQL-database, run the SQL script:

```sh
psql -U postgres -d smart_home -f backend/schema.sql

docker exec -i postgres_db psql -U postgres -d smart_home < backend/schema.sql


