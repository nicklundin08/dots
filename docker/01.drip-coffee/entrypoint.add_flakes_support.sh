#! /bin/sh

set -e
echo "Starting nix daemon"
sudo /nix/var/nix/profiles/default/bin/nix-daemon &
echo "Nix daemon started"

echo "Try it out"
echo "\tnix-shell -p cowsay"
/bin/bash
