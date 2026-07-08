#! /bin/bash

set -e
echo "Installing nix"
yes | sh <(curl -L https://nixos.org/nix/install) --daemon
echo "Nix installed"
