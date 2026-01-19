{
  lib,
  config,
  ...
}: {
  options = {
    plex.enable = lib.mkEnableOption "Enables plex";
  };

  config = lib.mkIf config.plex.enable {
    services.plex = {
      enable = true;
      openFirewall = true;
    };
  };
}
