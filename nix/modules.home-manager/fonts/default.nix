{pkgs, ...}: {
  home.packages = with pkgs; [
    # Run `fc-cache -rv` if changing stuff wrt fonts!
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    comic-mono
  ];
}
