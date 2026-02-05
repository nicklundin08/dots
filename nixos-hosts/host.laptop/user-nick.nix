{
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
      nick = import ../../home-manager-hosts/home.default.nix;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    description = "Nick";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      discord-ptb
      signal-desktop
      alacritty
    ];
  };
}
