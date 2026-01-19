{
  lib,
  config,
  ...
}: {
  options = {
    nicksvim.enable = lib.mkEnableOption "Enables nicksvim program";
    # TODO: this!!

    nicksvim.alias_to_vim = lib.mkOption {
      type = lib.types.boolean;
      default = true;
      description = "(TODO) Whether to alias nvim to nicksvim";
    };
  };

  config = lib.mkIf config.nicksvim.enable {
    programs.neovim = {
      enable = true;
    };

    xdg.configFile."nicksvim".source = ./xdg-config-nicksvim;
    home.shellAliases = {
      "nvim" = "NVIM_APPNAME=nicksvim nvim";
    };
  };
}
