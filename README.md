# Workspace

## Prerequisites

Install [Docker](https://docs.docker.com/engine/install/).

## Get started

1. Initialize repositories.

```shell
make submodule
```

2. You need to setup environment variables at `.env` (or using `export` command). Please refer the [.env.example](./.env.example).

3. Build docker images.

```shell
make docker-build-all
```

4. Start docker compose.

```shell
make quick-start
```

## Development environment


Install [Golang 1.23](https://go.dev/doc/install).

### Clone all repositories

```shell
git clone https://github.com/todennus/workspace
git clone https://github.com/todennus/docs
git clone https://github.com/todennus/oauth2-service
git clone https://github.com/todennus/user-service
git clone https://github.com/todennus/idp
git clone https://github.com/todennus/migration
git clone https://github.com/todennus/proto
git clone https://github.com/todennus/shared
git clone https://github.com/todennus/x
```

### Setup go workspace

```shell
go work init docs
go work use oauth2-service
go work use user-service
go work use migration
go work use shared
go work use proto
go work use x
```

### Copy makefile

```shell
$ cd workspace
workspace$ cp workspace.Makefile ../Makefile
```

## First Use

1. Create the first user. The first registered user is always admininistrator.

```
POST /users

{
  "username": "admin",
  "password": "P@ssw0rd"
}
```

2. Create the first OAuth2 Client. This API Endpoint will be blocked after the
first client is created.

```
POST /oauth2_clients/first

{
  "name": "Admin Client",
  "is_confidential": true,
  "username": "admin",
  "password": "P@ssw0rd"
}
```

3. You can use the OAuth2 flow now.

```
POST /oauth2/token

grant_type=password&
client_id=CLIENT_ID&
client_secret=CLIENT_SECRET&
username=admin&
password=P@ssw0rd
```
