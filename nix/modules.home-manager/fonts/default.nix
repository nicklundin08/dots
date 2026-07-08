{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  catppuccin.alacritty.enable = true;
  catppuccin.alacritty.flavor = "mocha";

  home.packages = with pkgs; [
    # Run `fc-cache -rv` if changing stuff wrt fonts!
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    comic-mono
  ];
}
