{
  inputs,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    inputs.xremap.nixosModules.default
  ];
  # https://github.com/xremap/nix-flake/blob/master/docs/HOWTO.md
  services.xremap = {
    enable = true;
    withX11 = true;
    # /*
    # NOTE: since this sample configuration does not have any DE, xremap needs to be started manually by systemctl --user start xremap
    # */
    # serviceMode = "user";
    # userName = "nick";
  };
  # Modmap for single key rebinds
  services.xremap.config.modmap = [
    {
      name = "Global";
      remap = {"CapsLock" = "Ctrl_R";};
    }
  ];

  systemd.user.services.set-xhost = {
    description = "Run a one-shot command upon user login";
    path = [pkgs.xorg.xhost];
    wantedBy = ["default.target"];
    script = "xhost +SI:localuser:root";
    environment.DISPLAY = ":0.0"; # NOTE: This is hardcoded for this flake
  };
}
