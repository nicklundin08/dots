{pkgs, ...}: {
  imports = [
    ./add-docs
    ./add-git
    ./add-java-server
    ./add-liquibase
  ];

  home.shellAliases = {
    "stackbuilder.default" = ''
      stackbuilder.add_git && \
      stackbuilder.add_docs && \
      stackbuilder.add_liquibase
    '';
  };
}
