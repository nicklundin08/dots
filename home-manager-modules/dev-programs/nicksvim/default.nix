{
  lib,
  pkgs,
  config,
  ...
}: let
  mkPluginFromJsonEntry = jsonEntry:
    pkgs.vimUtils.buildVimPlugin {
      name = jsonEntry.name;
      src = pkgs.fetchFromGitHub {
        owner = jsonEntry.owner;
        repo = jsonEntry.repo;
        rev = jsonEntry.rev;
        hash = jsonEntry.hash;
      };
      doCheck = false; # YEET!
    };
  start-plugins = builtins.map mkPluginFromJsonEntry (builtins.fromJSON (builtins.readFile ./plugins.start.json));
  cfg = config.nicksvim;
in {
  options.nicksvim = {
    enable = lib.mkEnableOption "Enables nicksvim program";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      plugins = start-plugins;
    };

    xdg.configFile."nvim".source = ./xdg-config-nvim;
  };
}
