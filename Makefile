########################################################################################################################

DB_CONTAINER := pgpods_database_1
TRO_HOME := /opt/app/tro

########################################################################################################################

db-build-dirs:
	docker exec -it ${DB_CONTAINER} bash -c 'mkdir -p ${TRO_HOME}/local'
	docker cp db/local/bin/ ${DB_CONTAINER}:${TRO_HOME}/local/bin
	docker cp db/local/sql/ ${DB_CONTAINER}:${TRO_HOME}/local/sql
	docker exec -it ${DB_CONTAINER} bash -c 'mkdir -p ${TRO_HOME}/local/log'
	docker exec -it ${DB_CONTAINER} bash -c 'ls -ltR /opt/app/tro/local'

db-run-part1:
	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part1.sql postgres postgres'

db-run-part2:
	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part2.sql'

db-exec:
	docker exec -it ${DB_CONTAINER} /bin/bash 

db-psql:
	psql -h localhost -p 5432 -d tro -U postgres

db-list-all:
	psql -h localhost -p 5432 -d postgres -U postgres -c '\l' -c '\du'

db-reset-all:
	docker exec -it ${DB_CONTAINER} bash -c 'rm -rf ${TRO_HOME}/local'
	psql --set=environment=${ENVIRONMENT} -h localhost -p 5432 -d postgres -U postgres -c 'DROP DATABASE ${ENVIRONMENT};'
	psql -h localhost -p 5432 -d postgres -U postgres -c 'DROP USER jeff;'
	psql -h localhost -p 5432 -d postgres -U postgres -c 'DROP USER tro;'

db-test:
	docker cp db/local/sql/ ${DB_CONTAINER}:${TRO_HOME}/local/sql

########################################################################################################################

# tr-up:
# 	cd /Users/jeff/devl/TRO
# 	docker-compose up -d
