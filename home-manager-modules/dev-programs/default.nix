{lib, ...}: {
  imports = [
    ./bash
    ./dots
    ./git
    ./misc-packages
    ./nicksvim
    ./tmux
  ];

  # Custom options
  bash.enable = lib.mkDefault true;
  dots.enable = lib.mkDefault false; # TODO: turn this one once I figure out whats wrong with the mapping fn
  git.enable = lib.mkDefault true;
  nicksvim.enable = lib.mkDefault true;
  nicksvim.alias_to_vim = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;

  # Home-manager options
  home.username = lib.mkDefault "nick";
  home.homeDirectory = lib.mkDefault "/home/nick";
  programs.git.settings = {
    user.email = lib.mkDefault "nick@moontower.net";
    user.name = lib.mkDefault "Nick Lundin";
    extraConfig.github.user = lib.mkDefault "nicklundin08";
  };
}
