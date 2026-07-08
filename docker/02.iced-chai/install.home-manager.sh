#! /bin/sh

set -e
echo "Installing home-manager."
/nix/var/nix/profiles/default/bin/nix-channel --add https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz home-manager
sudo /nix/var/nix/profiles/default/bin/nix-channel --update
# sudo /nix/var/nix/profiles/default/bin/nix-shell '<home-manager>' -A install
echo "Home-manager installed."
