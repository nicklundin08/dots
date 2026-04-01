{lib, ...}: {
  imports = [
    ./headscale.nix
    ./headscale-ui.nix
    ./ssh.nix
    ./jellyfin.nix
    ./nginx.nix
    ./tailscale.nix
    ./wireguard.nix
  ];
}
