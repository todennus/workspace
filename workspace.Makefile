docker-build-docs:
	cd docs && make docker-build

docker-build-oauth2-service:
	docker build -t todennus/oauth2-service -f ./oauth2-service/build/package/workspace.Dockerfile .

docker-build-user-service:
	docker build -t todennus/user-service -f ./user-service/build/package/workspace.Dockerfile .

docker-build-idp:
	cd idp && make docker-build

docker-build-migration:
	docker build -t todennus/migration -f ./migration/workspace.Dockerfile .

docker-build-all: \
	docker-build-docs \
	docker-build-user-service \
	docker-build-oauth2-service \
	docker-build-migration docker-build-idp

quick-start:
	docker compose -f workspace/workspace.quick-start.yaml up -d

quick-start-down:
	docker compose -f workspace/workspace.quick-start.yaml down
