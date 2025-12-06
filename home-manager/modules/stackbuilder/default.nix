{pkgs, ...}: {
  imports = [
    ./add-docs
    ./add-git
    ./add-java-server
    ./add-liquibase
    ./add-pg-queries
    ./add-devenv
    ./add-dockerfiles
    ./add-compose
    ./add-vite-app
    ./add-golang-server
  ];

  home.shellAliases = {
    "stackbuilder.default" = ''
      set -e

      echo $"Enter project name"
      read PROJECT_NAME
      mkdir $PROJECT_NAME && cd $PROJECT_NAME

      stackbuilder.add_git

      echo "Adding docs"
      stackbuilder.add_docs

      echo "Adding devenv"
      stackbuilder.add_devenv

      echo "Adding dockerfiles"
      stackbuilder.add_dockerfiles

      echo "Adding compose"
      stackbuilder.add_compose

      echo "Adding postgres support"
      stackbuilder.add_pg_queries

      echo "Adding liquibase"
      stackbuilder.add_liquibase

      echo "Adding golang server"
      stackbuilder.add_golang_server

      echo "Adding vite app"
      stackbuilder.add_vite_app
    '';
  };
}
