

tr-exec-db:
	docker exec -it tro_db_1 /bin/bash


tr-psql-db:
	psql -h localhost -p 5432 -d tro -U postgres


tr-up:
	cd /Users/jeff/devl/TRO
	docker-compose up -d

