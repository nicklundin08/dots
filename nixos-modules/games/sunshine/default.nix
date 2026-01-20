{
  lib,
  pkgs,
  config,
  ...
}: let
  # https://nixos.wiki/wiki/Sunshine
  cfg = config.sunshine;
in {
  options.sunshine = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enables sunshine";
    };
  };

  config = lib.mkIf cfg.enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
