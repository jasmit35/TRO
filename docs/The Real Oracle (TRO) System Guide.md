# The Real Oracle (TRO) System Guide
## Building the initial database

### Development

Use the kcpcc (kubectl print current context) alias to insure you are pointing to the devl environment:

```
kcpcc
```
*devl*

Sign into psql to make sure you are pointing to the correct database:

```
psql -h localhost -p 5430 -d postgres -U postgres 
\l
```
Change to the project's sql directory:

```
cd ~/devl/TRO/local/sql
```

Use the Makefile to build the database and schema:

```
make create-database
make create-schema
```
Then users and privilages:
```
make create-users
make create-privs
```
And finallly the tables:

```
make create-tables
```
If any changes were made, be sure to commit the code to the github repository.

### Test
Run the standard upgrade script:

```
auto-update -a TRO -e test
```

Use the kcpcc (kubectl print current context) alias to insure you are pointing to the test environment:

```
kcpcc
```
*test*

Sign into psql to make sure you are pointing to the correct database:

```
psql -h localhost -p 5432 -d postgres -U postgres 
\l
```

Change to the project's sql directory:

```
cd ~/test/TRO/local/sql
```

Use the Makefile to build the database, users, schema and privs:

```
make create-database
make create-users
make create-schema
make create-privs
```

And finallly the tables:

```
make create-tables
```

If any changes were made, be sure to commit the code to the github repository.


### Production
Run the standard upgrade script:

```
cd ~/prod
auto-update -a TRO -e prod
```
Use the kcpcc (kubectl print current context) alias to insure you are pointing to the Production environment:

```
kcpcc
```
*prod*

Make sure the ENVIRONMENT variable is set correctly:

```
export ENVIRONMENT=prod
echo $ENVIRONMENT
```
*prod*

Sign into psql to make sure you are pointing to the correct database:

```
psql -h kmaster -U postgres 
\l
\q
```
Change to the project's sql directory:

```
cd ~/prod/TRO/local/sql
```

Use the Makefile to build the database, users, schema and privs:

```
make create-database
make create-users
make create-schema
make create-privs
```

And finallly the tables:

```
make create-tables
```
Display the objects:

```
make list-all
```
git If any changes were made, be sure to commit the code to the github repository.













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



# Version 2.1 #
## Build in test without a container

Upgrade the code in test to the current version.

`auto-update -a tro -e test`

Clean all the resources for TRO (only) out of the database.

`cd ~/test/tro/local/sql`

`psql -d test -U tro`

`\i drop_all_tables.sql`

`\q`

`psql -d test -U postgres`

`\i drop_owner.sql`

Create the schema then the tables using the approate id:

`psql -d test -U postgres`

`\i create_schema.sql`

`\q`

`psql -d test -U tro`

`\i create_tables.sql`

## Load and validate the data

Load the startup data:

`psql -d test -U tro -f set_start.sql`

Load the data for the first quarter of 2020:

Run the report and validate the load was successful:

Load the remainder of the 2020 data and validate:

Load the remainder of the data:












