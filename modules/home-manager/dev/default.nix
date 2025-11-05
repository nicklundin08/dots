{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    dev.enable = lib.mkEnableOption "enables dev";
  };

  config = lib.mkIf config.dev.enable {
    home.packages = [
      pkgs.cowsay
    ];
  };
}
