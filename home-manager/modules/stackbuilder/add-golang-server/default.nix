{config, ...}: {
  xdg.configFile."stackbuilder/golang_gin_server" = {
    enable = true;
    source = ./golang;
  };
  # xdg.configFile."stackbuilder/scripts.golang_gin_server" = {
  #   enable = true;
  #   source = ./scripts;
  # };
  home.shellAliases = {
    "stackbuilder.add_golang_server" = ''
      mkdir -p scripts/ || true
      mkdir -p src.server/ || true

      cd src.server/
      go mod init gin-quickstart
      go get -u github.com/gin-gonic/gin
      cp -r ${config.xdg.configHome}/stackbuilder/golang_gin_server/* ./
      cd ..

      # cd scripts
      # cp -r ${config.xdg.configHome}/stackbuilder/scripts.golang_gin_server/* ./
      # cd ..
    '';
  };
}
