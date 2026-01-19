{
  lib,
  config,
  ...
}: let 
  cfg = config.nicksvim;
in{
  options.nicksvim = {
    enable = lib.mkEnableOption "Enables nicksvim program";

    alias_to_vim = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to alias nvim to nicksvim";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
    };

    xdg.configFile."nicksvim".source = ./xdg-config-nicksvim;
    home.shellAliases = lib.mkIf cfg.alias_to_vim {
      "nvim" = "NVIM_APPNAME=nicksvim nvim";
    };
  };
}
