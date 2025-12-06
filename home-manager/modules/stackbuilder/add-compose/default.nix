{config, ...}: {
  xdg.configFile."stackbuilder/docker.compose" = {
    enable = true;
    source = ./compose;
  };

  home.shellAliases = {
    "stackbuilder.add_compose" = ''
      set -e
      mkdir -p docker.compose/ || true
      cd docker.compose/

      cp -r ${config.xdg.configHome}/stackbuilder/docker.compose/* ./

      cd ..
    '';
  };
}
