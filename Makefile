.PHONY: scooby.docker_up
scooby.docker_up:
	sudo docker-compose -f ./docker-compose.yml -p devops up -d


.PHONY: scooby.build_postgres
scooby.build_postgres:
	@docker image rm postgres/tp || exit 0
	docker build -t postgres/tp .

.PHONY: scooby.run_postgres
scooby.run_postgres:
	@docker stop postgresTP || exit 0
	@docker stop adminer || exit 0
	@docker rm postgresTP || exit 0
	@docker rm adminer || exit 0
	docker run -d -p 5432:5432 --network app-network -v ./volumes:/var/lib/postgresql/data --name postgresTP postgres/tp
	docker run -d -p 8081:8080 --network app-network --name adminer adminer

.PHONY: scooby.build_java
scooby.build_java:
	@docker image rm java/tp || exit 0
	docker build -t java/tp -f Dockerfile.java .

.PHONY: scooby.run_java
scooby.run_java:
	@docker stop javaTP || exit 0
	@docker rm javaTP || exit 0
	docker run --name javaTP java/tp

.PHONY: scooby.build_api
scooby.build_api:
	@docker image rm api/tp || exit 0
	docker build -t api/tp -f Dockerfile.api .

.PHONY: scooby.run_api
scooby.run_api:
	@docker stop apiTP || exit 0
	@docker rm apiTP || exit 0
	docker run -d -p 8080:8080 --network app-network --name apiTP api/tp
	@echo "Backend is running ..."


.PHONY: scooby.build_apache
scooby.build_apache:
	@docker image rm apache/tp || exit 0
	docker build -t apache/tp -f Dockerfile.apache .

.PHONY: scooby.run_apache
scooby.run_apache:
	@docker stop apacheTP || exit 0
	@docker rm apacheTP || exit 0
	docker run -d -p 80:80 --network app-network --name apacheTP apache/tp
	@echo "Backend is running ..."