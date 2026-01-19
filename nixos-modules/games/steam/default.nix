{
  lib,
  pkgs,
  config,
  ...
}:
{
  options = {
    steam.enable = lib.mkEnableOption "Enables steam";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true; # Master switch, already covered in installation
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
      # Other general flags if available can be set here.
    };

    environment.systemPackages = with pkgs; [
      protonup-ng
    ];

    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS =
          "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
