{config, ...}: {
  xdg.configFile."stackbuilder/db.liquibase" = {
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
      mkdir db.liquibase

      cd scripts
      cp -r ${config.xdg.configHome}/stackbuilder/scripts.liquibase/* ./
      cd ..


      cd db.liquibase
      cp -r ${config.xdg.configHome}/stackbuilder/db.liquibase/* ./

      cd ..
    '';
  };
}
