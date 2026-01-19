{
  inputs,
  outputs,
  lib,
  pkgs,
  config,
  ...
}: let
  user-name = "nick";
  user-name-user = "${user-name}-user";
  cfg = builtins.getAttr user-name-user config;
in {
  options.${user-name-user} = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables ${user-name} user";
    };

    enable-home-manager = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enables home-manager configuration (as nixos module) for ${user-name} user.";
    };
    home-configuration = lib.mkOption {
      description = "home-manager configuration to use";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users = {
      ${user-name} = {
        isNormalUser = true;
        description = user-name;
        extraGroups = ["networkmanager" "wheel"];
        packages = with pkgs; [
          discord-ptb
          signal-desktop
          #  thunderbird
        ];
      };
    };

    home-manager = lib.mkIf cfg.enable-home-manager {
      extraSpecialArgs = {inherit inputs outputs;};
      users = {
        ${user-name} = cfg.home-configuration;
      };
    };

    services.xremap = {
      enable = true;
      /*
      NOTE: since this sample configuration does not have any DE, xremap needs to be started manually by systemctl --user start xremap
      */
      serviceMode = "user";
      userName = user-name;
    };
    # Modmap for single key rebinds
    services.xremap.config.modmap = [
      {
        name = "Global";
        remap = {"CapsLock" = "Ctrl_R";};
      }
    ];
  };
}
