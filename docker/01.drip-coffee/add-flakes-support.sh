#! /bin/sh

set -e
echo "Adding flakes support."
sudo echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
echo "Flakes support added"
