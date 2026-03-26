{
  lib,
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  programs.firefox.enable = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      # Import your home-manager configuration
      nick = import ../../home-manager-hosts/home.wfh.nix;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.work = {
    isNormalUser = true;
    description = "work";
    extraGroups = ["networkmanager" "wheel" "docker" "dots"];
    packages = with pkgs; [
    ];
  };

  # fonts.packages = ["JetBrains Mono"] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  # fonts.packages = ["JetBrains Mono"] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  # fonts.packages = with pkgs; [
  #   nerd-fonts.fira-code
  #   nerd-fonts.droid-sans-mono
  # ];
}
