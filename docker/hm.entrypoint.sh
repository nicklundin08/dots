#! /bin/sh

set -e
echo "Starting nix daemon"
sudo /nix/var/nix/profiles/default/bin/nix-daemon &
echo "Nix daemon started"

/bin/bash
