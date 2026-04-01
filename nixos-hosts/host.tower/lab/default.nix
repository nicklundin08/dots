{lib, ...}: {
  imports = [
    ./headscale.nix
    ./headscale-ui.nix
    ./ssh.nix
    ./jellyfin.nix
    ./nginx.nix
    ./wireguard.nix
  ];
}
