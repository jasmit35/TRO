# The Real Oracle (TRO) System Guide
## Building the database
Building the initial database
Change to the sql directory:

`cd .../TRO/local/sql`

Use the run_sql.sh script to execute the first part of the setup using the postgres database user ID:

`./run_sql.sh build_initial_db_part1.sql postgres postgres`

Check the log file and correct any errors.

`view build_initial_db_part1.sql.log`

Use the run_sql script to execute the second part of the setup using the TRO database and user ID:

`./run_sql.sh build_initial_db_part2.sql tro tro`

Check the log file and correct any errors.

`view build_initial_db_part2.sql.log`


## Steps to upgrade Test and Prod environments to a new version.

Change to the sql directory:

`cd .../TRO/local/sql`

Use the run_sql.sh script to execute the first part of the setup using the postgres database user ID:

`run_sql.sh build_initial_db_part1.sql postgres postgres`

Check the log file and correct any errors.

Use the run_sql script to execute the second part of the setup using the TRO database and user ID:

`run_sql.sh build_initial_db_part2.sql tro tro`

## Docker commands
Build the image from the docker fiie:

`docker build -t myimage .`

List existing images:

`docker images`

Run the docker container:

`docker run -d -p 5000:5000 myimage`

Build all components using docker-compose and the project yaml file:

`docker-compose up -d`

Stop and remove all project containers:

`docker-compose down`

Check the status of the project:

`docker-compose ps`

To rebuild after changes and restart the project:

`docker-compose build`

`docker-compose up -d`

Check the logs of a container:

`docker-compose logs app`


## Build the database in the container

Copy the code needed into the /tmp directory within the container:

`for file in *.sh; do  docker cp ${file} 7f7e4c05ed60:/tmp; done`

`for file in *.sql; do  docker cp ${file} 7f7e4c05ed60:/tmp; done`

Execute the code within the container itself:

`docker exec 7f7e4c05ed60 /bin/bash -c '/tmp/run_sql.sh /tmp/build_initial_db_part1.sql postgres postgres'`

`docker exec 7f7e4c05ed60 /bin/bash -c '/tmp/run_sql.sh /tmp/build_initial_db_part2.sql tro tro'`

You can ignore the NOTICE: messages from the table creation scripts. They are caused by using 'create or replace' syntax.



