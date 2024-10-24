docker-build-backend:
	cd backend && make docker-build

docker-build-migration:
	cd migration && make docker-build

docker-build-idp:
	cd idp && make docker-build

docker-build-all: docker-build-backend docker-build-migration docker-build-idp

quick-start:
	docker compose --env-file .env -f quick-start.yaml up -d

quick-start-down:
	docker compose -f quick-start.yaml down
