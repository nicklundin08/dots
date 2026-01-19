{
  inputs,
  outputs,
  lib,
  pkgs,
  config,
  
  ...
}: {
  options = {
    nick.enable = lib.mkEnableOption "Enables Nick user";
    nick.home-host = lib.mkOption {
      #type = lib.types.string;
      default = "home.default.nix";
      description = "home host file to use";
    };
  };

  config = lib.mkIf config.nick.enable {
    home-manager = {
      extraSpecialArgs = {inherit inputs outputs;};
      users = {
        nick = outputs.homeConfigurations."nick@nixos";
      };
    };
    users.users.nick = {
      isNormalUser = true;
      description = "Nick";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [
        discord-ptb
        signal-desktop
        #  thunderbird
      ];
    };

    services.xremap = {
      enable = true;
      /*
      NOTE: since this sample configuration does not have any DE, xremap needs to be started manually by systemctl --user start xremap
      */
      serviceMode = "user";
      userName = "nick";
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
