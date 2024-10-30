# Workspace

## Prerequisites

Install [Docker](https://docs.docker.com/engine/install/).

## Get started

1. Initialize repositories.

```shell
make submodule-clone
```

2. You need to setup environment variables at `.env` (or using `export` command). Please refer the [.env.example](./.env.example).

3. Build docker images.

```shell
make docker-build-all
```

4. For the first time you start the system, please seed the first Admin User and Admin Client.

```shell
# Seed the Admin User and store the User ID.
make seed-user username=<your-username> password=<your-password>
```

```shell
# Use Admin User ID in previous command to create the first Admin Client.
make seed-client userid=<admin-user-id>
```

Then copy the ClientID and ClientSecret into .env file.

```
SERVICE_CLIENT_ID=<client-id>
SERVICE_CLIENT_SECRET=<client-secret>
```

5. Start docker compose.

```shell
make quick-start
```

## Development environment


Install [Golang 1.23](https://go.dev/doc/install).

Create a directory called `todennus`, then run these following commands:

### Clone all repositories

```shell
git clone https://github.com/todennus/workspace
git clone https://github.com/todennus/docs
git clone https://github.com/todennus/oauth2-service
git clone https://github.com/todennus/oauth2-client-service
git clone https://github.com/todennus/user-service
git clone https://github.com/todennus/idp
git clone https://github.com/todennus/migration
git clone https://github.com/todennus/proto
git clone https://github.com/todennus/shared
git clone https://github.com/todennus/x
```

### Setup Golang workspace

```shell
go work init docs
go work use oauth2-service
go work use oauth2-client-service
go work use user-service
go work use migration
go work use shared
go work use proto
go work use x
```

### Copy makefile

```shell
cp workspace/workspace.Makefile ./Makefile
```

### Setup environment

Setup `.env` file at each repository, refer `.env.example` file in that repository.

### Start system

1. Build docker images.

```shell
make docker-build-all
```

2. For the first time you start the system, please seed the first Admin User and Admin Client.

```shell
# Seed the Admin User and store the User ID.
make seed-user username=<your-username> password=<your-password>
```

```shell
# Use Admin User ID in previous command to create the first Admin Client.
make seed-client userid=<admin-user-id>
```

Then copy the ClientID into `./oauth2-service/.env` file. `oauth2-service` has a mechanism to self-authenticate, it only needs the ClientID to generate an authentic token.

```
SERVICE_CLIENT_ID=<client-id>
```

3. You can use the above ClientID and ClientSecret to setup authentication of other services (such as `oauth2-client-service`) or create new Admin Clients and uses theirs credentials for each service.

4. Start docker compose.

```shell
make quick-start
```
