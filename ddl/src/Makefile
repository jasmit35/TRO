
ENV := "${ENVIRONMENT}"

run-build-part1:
	./local/bin/run_sql.sh ./local/sql/initial_build_part1.sql postgres postgres >./local/log/run_build_part1.log 2>&1

grant_privs:
	./local/bin/run_sql.sh ./local/sql/grant_privs.sql postgres ${ENV} >./local/log/grant_privs.log 2>&1

create_tables:
	./local/bin/run_sql.sh ./local/sql/create_tables.sql tro ${ENV} >./local/log/create_tables.log 2>&1

