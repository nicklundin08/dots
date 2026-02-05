{
  lib,
  pkgs,
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
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            #family = "FiraCode Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font";
            #family = "FiraCode Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "JetBrainsMono Nerd Font";
            #family = "FiraCode Nerd Font";
            style = "Italic";
          };
          size = 12.0;
        };
      };
    };
    catppuccin.alacritty.enable = true;
    catppuccin.alacritty.flavor = "mocha";

    home.packages = with pkgs; [
      # Run `fc-cache -rv` if changing stuff wrt fonts!
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
    ];
  };
}
