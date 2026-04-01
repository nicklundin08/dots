{lib, ...}: {
  imports = [
    ./headscale.nix
    ./ssh.nix
    ./jellyfin.nix
    ./nginx.nix
    ./wireguard.nix
  ];
}
