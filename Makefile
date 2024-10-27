docker-build-docs:
	cd docs && make docker-build

docker-build-user-service:
	cd user-service && make docker-build

docker-build-oauth2-service:
	cd oauth2-service && make docker-build

docker-build-oauth2-client-service:
	cd oauth2-client-service && make docker-build

docker-build-migration:
	cd migration && make docker-build

docker-build-idp:
	cd idp && make docker-build

docker-build-all: \
	docker-build-docs \
	docker-build-user-service \
	docker-build-oauth2-service \
	docker-build-oauth2-client-service \
	docker-build-migration docker-build-idp

quick-start:
	docker compose --env-file .env -f quick-start.yaml up -d

quick-start-down:
	docker compose -f quick-start.yaml down

submodule:
	git submodule update --init --remote --merge 
