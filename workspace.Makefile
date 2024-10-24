start-rest:
	go run ./backend/cmd/main.go rest --env ./backend/.env

docker-build-backend:
	docker build -t todennus/backend -f ./backend/build/package/workspace.Dockerfile .

docker-build-idp:
	cd idp && make docker-build

docker-build-migration:
	docker build -t todennus/migration -f ./migration/workspace.Dockerfile .

quick-start:
	cd workspace && make quick-start

quick-start-down:
	cd workspace && make quick-start-down
