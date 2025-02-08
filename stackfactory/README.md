# Stackfactory

Language agnostic parts that you can build on for your web application

:warning: Not a framework

:warning: Application code (server/client/cron/etc) not included


# :rocket: Core components
## :floppy_disk: Stable, open-source parts
- postgres + liquibase
- docker
## :repeat: Declarative approach for maximum repeatability
- declarative api contract management with openapi
- declarative db schema management with liquibase
- declarative dev environment with nix and direnv
- declarative local dependencies with a tidy docker-compose stack
- spin up a fresh VM/container/whatever and have a working environment in seconds
## :robot: Automate it all
- prevent api breaking changes with [openapi-changes ](https://github.com/pb33f/openapi-changes)
- generate ERDs from your local db with [TBLS](https://github.com/k1LoW/tbls)


BYO parts (things you likely want to add that ARE language specific)
- Linting: pre-commit/checkstyle/spotless/eslint
    - Checkstyle is included as a sample
- Test coverage: Jacoco/cloverage/dotcov/etc
- Seed data patterns: Project Faker / Instancio / FactoryBot

# Getting started

Clone this repo and purge everything outside of this directory.

### Local dev setup

Follow the instructions in ./docs/DEV_SETUP.md
