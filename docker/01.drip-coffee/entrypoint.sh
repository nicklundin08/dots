#! /bin/bash

set -e
echo "Starting nix daemon"
sudo /nix/var/nix/profiles/default/bin/nix-daemon &
echo "Nix daemon started"

for arg in "$@"
do
    $arg
done
