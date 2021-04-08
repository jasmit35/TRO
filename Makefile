########################################################################################################################

DB_CONTAINER := 18152e822d2f
TRO_HOME := /opt/app/tro

########################################################################################################################

db-copy-bin:
	docker cp db/local/bin/ 18152e822d2f:/opt/app/tro/local/

db-copy-sql:
	docker cp db/local/sql/ 18152e822d2f:/opt/app/tro/local/

db-local-list:
	docker exec -it 18152e822d2f bash -c 'ls -ltR /opt/app/tro/local'

db-run-part1:
	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part1.sql postgres postgres'

db-run-part2:
	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part2.sql'

db-exec-in:
	docker exec -it ${DB_CONTAINER} /bin/bash 

########################################################################################################################
#
# tr-exec-db:
# 	docker exec -it tro_db_1 /bin/bash

# tr-psql-db:
# 	psql -h localhost -p 5432 -d tro -U postgres

# tr-up:
# 	cd /Users/jeff/devl/TRO
# 	docker-compose up -d