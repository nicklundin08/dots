{pkgs, ...}: {
  programs.steam = {
    enable = true; # Master switch, already covered in installation
    gamescopeSession.enable = true; # Master switch, already covered in installation
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
    # Other general flags if available can be set here.
  };

  programs.gamemode.enable = true; # Master switch, already covered in installation

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    protonup-ng
    lutris
    bottles
    heroic
  ];

  #   environment.sessionVariables = {
  #     STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  #   };
}
