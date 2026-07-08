# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  azWithExtensions = pkgs.azure-cli.withExtensions [
    # pkgs.azure-cli-extensions.terraform
    # pkgs.azure-cli-extensions.aks-preview
    pkgs.azure-cli-extensions.azure-devops
  ];
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];
  environment.systemPackages = [
    pkgs.k9s
    pkgs.k6
    pkgs.wireguard-tools
    pkgs.postgresql
    azWithExtensions
  ];
  # programs.firefox.enable = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      # Import your home-manager configuration
      nick = import ../home-manager.arm/home.arm.nix;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    home = "/Users/nick";
    # isNormalUser = true;
    description = "Nick";
    # extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      # wireguard-tools
    ];
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = outputs.self.rev or outputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
