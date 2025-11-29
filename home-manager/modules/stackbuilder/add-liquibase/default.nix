{config, ...}: {
  xdg.configFile."stackbuilder/liquibase" = {
    enable = true;
    source = ./liquibase;
  };

  xdg.configFile."stackbuilder/scripts.liquibase" = {
    enable = true;
    source = ./scripts;
  };

  home.shellAliases = {
    "stackbuilder.add_liquibase" = ''
      mkdir -p scripts/ || true
      mkdir liquibase

      cd scripts
      cp -r ${config.xdg.configHome}/stackbuilder/scripts.liquibase/* ./


      cd ../liquibase
      cp -r ${config.xdg.configHome}/stackbuilder/liquibase/* ./

      cd ..
    '';
  };
}
