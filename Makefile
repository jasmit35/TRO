########################################################################################################################

# db-build-dirs:
# 	docker exec -it ${DB_CONTAINER} bash -c 'mkdir -p ${TRO_HOME}/local'
# 	docker cp db/local/bin/ ${DB_CONTAINER}:${TRO_HOME}/local/bin
# 	docker cp db/local/sql/ ${DB_CONTAINER}:${TRO_HOME}/local/sql
# 	docker exec -it ${DB_CONTAINER} bash -c 'mkdir -p ${TRO_HOME}/local/log'
# 	docker exec -it ${DB_CONTAINER} bash -c 'ls -ltR /opt/app/tro/local'
# 
# db-run-part1:
#	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part1.sql postgres postgres'

# db-run-part2:
# 	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part2.sql postgres ${ENVIRONMENT}'

# db-exec:
# 	docker exec -it ${DB_CONTAINER} /bin/bash 

# db-psql:
# 	psql -h localhost -p 5432 -d tro -U postgres

# db-list-all:
# 	psql -h localhost -p 5432 -d ${ENVIRONMENT} -U postgres -c 'set SEARCH_PATH to ''tro, public''' -c '\l' -c '\du' -c '\dn' -c '\dt'

# db-reset-all:
# 	docker exec -it ${DB_CONTAINER} bash -c 'rm -rf ${TRO_HOME}/local'
# 	psql --set=environment=${ENVIRONMENT} -h localhost -p 5432 -d postgres -U postgres -c 'DROP DATABASE ${ENVIRONMENT};'
# 	psql -h localhost -p 5432 -d postgres -U postgres -c 'DROP USER jeff;'
# 	psql -h localhost -p 5432 -d postgres -U postgres -c 'DROP USER tro;'

# db-test:
# 	docker cp db/local/sql/ ${DB_CONTAINER}:${TRO_HOME}/local/sql

########################################################################################################################

ENV := "${ENVIRONMENT}"

ifeq (${ENV}, "devl")
	TRO_HOME := "/Users/jeff/devl/tro"
endif

ifeq (${ENV}, "test")
	TRO_HOME := "/Users/jeff/test/tro"
endif

ifeq (${ENV}, "prod")
	TRO_HOME := "/home/jeff/prod/tro"
endif

DCYAML := "${TRO_HOME}/docker-compose.yaml"

########################################################################################################################

build:
	docker-compose --file=${DCYAML} build --build-arg ENVIRONMENT=${ENV}

build-full:
	docker-compose --file=${DCYAML} build --pull --no-cache

run:
	docker-compose --file=${DCYAML} up -d
	docker-compose --file=${DCYAML} ps

ps:
	docker-compose --file=${DCYAML} ps

logs:
	docker-compose --file=${DCYAML} logs ddl 

exec:
	docker exec -it tro_ddl /bin/bash

stop:
	docker-compose --file=${DCYAML} stop ddl 

rm:
	docker-compose --file=${DCYAML} rm -fsv ddl 

test-run: build run logs stop rm

psql:
	psql -h localhost -d postgres -U postgres 



