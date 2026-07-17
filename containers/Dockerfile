# Use a Debian-based image
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && \
	apt-get install -y curl sudo bash coreutils bash xz-utils && \
	rm -rf /var/lib/apt/lists/*

# Add a user to simulate multi-user setup
RUN useradd -m -s /bin/bash nixuser && echo "nixuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the nixuser
USER nixuser
WORKDIR /home/nixuser

# Install Nix (Multi-User)
RUN echo "Installing nix" && \
	curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes && \
	# yes | sh <(curl -L https://nixos.org/nix/install) --daemon && \
	echo "Nix installed"

# ENTRYPOINT ["/bin/sh"]
