# Workspace

## Prerequisites

Install [Docker](https://docs.docker.com/engine/install/).

## Get started

1. Initialize repositories.

```shell
$ git clone https://github.com/todennus/workspace
$ cd workspace
workspace$ git submodule init
workspace$ git submodule update --remote --merge
```

2. You need to setup environment variables at `.env` (or using `export` command). Please refer the [.env.example](./.env.example).

3. Build docker images.

```shell
workspace$ make docker-build-all
```

4. Start docker compose.

```shell
workspace$ make quick-start
```

## Development environment


Install [Golang 1.23](https://go.dev/doc/install).

### Clone all repositories

```shell
$ git clone https://github.com/todennus/workspace
$ git clone https://github.com/todennus/backend
$ git clone https://github.com/todennus/idp
$ git clone https://github.com/todennus/migration
$ git clone https://github.com/todennus/config
$ git clone https://github.com/todennus/x
```

### Setup go workspace

```shell
$ go work init ./backend
$ go work use ./migration
$ go work use ./config
$ go work use ./x
```

### Copy makefile

```shell
$ cd workspace
workspace$ cp workspace.Makefile ../Makefile
```
