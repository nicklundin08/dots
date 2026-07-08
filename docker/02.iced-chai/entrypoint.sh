#! /bin/sh

set -e
echo "Starting nix daemon"
sudo /nix/var/nix/profiles/default/bin/nix-daemon &
echo "Nix daemon started"

echo "Make sure to source the home manager config"
echo "source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

echo "Try it out"
echo "\tnix-shell -p cowsay"
/bin/bash
