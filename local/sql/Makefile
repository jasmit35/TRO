########################################################################################################################
 
ENV := "${ENVIRONMENT}"
 
ifeq (${ENV}, "devl")
	HOST="localhost"
	PORT="5430"
endif
 
ifeq (${ENV}, "test")
	HOST="localhost"
	PORT="5432"
endif
 
ifeq (${ENV}, "prod")
	HOST="kmaster"
	PORT="5432"
endif

########################################################################################################################

create-database:
	$(shell psql -h ${HOST} -p ${PORT} -d postgres -U postgres --variable=NEW_DBNAME=${ENV} -f create_database.sql)

create-users:
	$(shell psql -h ${HOST} -p ${PORT} -d ${ENV} -U postgres -f create_users.sql)

create-schema:
	$(shell psql -h ${HOST} -p ${PORT} -d ${ENV} -U postgres -f create_schema.sql)

create-privs:
	$(shell psql -h ${HOST} -p ${PORT} -d ${ENV} -U postgres -f create_privs.sql)


########################################################################################################################

create-tables:
	psql -h ${HOST} -p ${PORT} -U tro -d ${ENV} -f accounts.sql
	view accounts.log
	psql -h ${HOST} -p ${PORT} -U tro -d ${ENV} -f category_types.sql
	view category_types.log
	psql -h ${HOST} -p ${PORT} -U tro -d ${ENV} -f category_groups.sql
	view category_groups.log
	psql -h ${HOST} -p ${PORT} -U tro -d ${ENV} -f categories.sql
	view categories.log
	psql -h ${HOST} -p ${PORT} -U tro -d ${ENV} -f transactions.sql
	view transactions.log


########################################################################################################################

list-all:
	psql -h ${HOST} -p ${PORT} -d ${ENV} -U postgres -c 'set SEARCH_PATH to ''tro, public''' -c '\l' -c '\du' -c '\dn' -c '\dt'


########################################################################################################################
# 
# 
# 
########################################################################################################################
# 
# db-build-dirs:
# 	docker exec -it ${DB_CONTAINER} bash -c 'mkdir -p ${TRO_HOME}/local'
# 	docker cp db/local/bin/ ${DB_CONTAINER}:${TRO_HOME}/local/bin
# 	docker cp db/local/sql/ ${DB_CONTAINER}:${TRO_HOME}/local/sql
# 	docker exec -it ${DB_CONTAINER} bash -c 'mkdir -p ${TRO_HOME}/local/log'
# 	docker exec -it ${DB_CONTAINER} bash -c 'ls -ltR /opt/app/tro/local'
# 
# db-run-part1:
#	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part1.sql postgres postgres'
# 
# db-run-part2:
# 	docker exec -it ${DB_CONTAINER} bash -c '${TRO_HOME}/local/bin/run_sql.sh ${TRO_HOME}/local/sql/build_initial_db_part2.sql postgres ${ENVIRONMENT}'
# 
# db-exec:
# 	docker exec -it ${DB_CONTAINER} /bin/bash 
# 
# db-psql:
# 	psql -h ${HOST} -p 5432 -d tro -U postgres
# 
# db-reset-all:
# 	docker exec -it ${DB_CONTAINER} bash -c 'rm -rf ${TRO_HOME}/local'
# 	psql --set=environment=${ENVIRONMENT} -h ${HOST} -p 5432 -d postgres -U postgres -c 'DROP DATABASE ${ENVIRONMENT};'
# 	psql -h ${HOST} -p 5432 -d postgres -U postgres -c 'DROP USER jeff;'
# 	psql -h ${HOST} -p 5432 -d postgres -U postgres -c 'DROP USER tro;'
# 
# db-test:
# 	docker cp db/local/sql/ ${DB_CONTAINER}:${TRO_HOME}/local/sql
# 

