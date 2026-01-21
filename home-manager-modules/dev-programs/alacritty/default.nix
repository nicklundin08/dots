{
  lib,
  config,
  inputs,
  ...
}: let
  cfg = config.alac;
in {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  options = {
    alac.enable = lib.mkEnableOption "enables alacritty terminal";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
    catppuccin.alacritty.enable = true;
    catppuccin.alacritty.flavor = "frappe";
  };
}
