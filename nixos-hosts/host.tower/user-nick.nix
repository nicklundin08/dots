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
      #  thunderbird
    ];
    openssh.authorizedKeys.keys = [
      # content of authorized_keys file
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGqxiC1euyE5Co96HAUX4GedI0aPgn/Mr2CsKIB3BOma nick@moontower.net"
      # note: ssh-copy-id will add user@your-machine after the public key
      # but we can remove the "@your-machine" part
    ];
  };
}
