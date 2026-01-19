{config, ...}: {
  xdg.configFile."stackbuilder/db.queries" = {
    enable = true;
    source = ./queries;
  };

  xdg.configFile."stackbuilder/scripts.queries" = {
    enable = true;
    source = ./scripts;
  };

  home.shellAliases = {
    "stackbuilder.add_pg_queries" = ''
      mkdir -p scripts/ || true
      mkdir db.queries

      cd scripts
      cp -r ${config.xdg.configHome}/stackbuilder/scripts.queries/* ./
      cd ..


      cd db.queries
      cp -r ${config.xdg.configHome}/stackbuilder/db.queries/* ./
      cd ..

    '';
  };
}
