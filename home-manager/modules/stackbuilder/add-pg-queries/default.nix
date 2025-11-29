{config, ...}: {
  xdg.configFile."stackbuilder/queries" = {
    enable = true;
    source = ./queries;
  };

  xdg.configFile."stackbuilder/scripts.queries" = {
    enable = true;
    source = ./queries;
  };

  home.shellAliases = {
    "stackbuilder.add_pg_queries" = ''
      mkdir -p scripts/ || true
      mkdir db.queries

      cd scripts
      cp -r ${config.xdg.configHome}/stackbuilder/scripts.queries/* ./


      cd ../db.queries
      cp -r ${config.xdg.configHome}/stackbuilder/db.queries/* ./

      cd ..
    '';
  };
}
