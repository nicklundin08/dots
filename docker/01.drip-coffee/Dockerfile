# Use a Debian-based image
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && \
	apt-get install -y curl sudo bash coreutils bash xz-utils && \
	rm -rf /var/lib/apt/lists/*

# Add a user to simulate multi-user setup
RUN useradd -m -s /bin/bash nixuser && echo "nixuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY install.nix.sh /drip-coffee/install.nix.sh
RUN chmod +x -R /drip-coffee/

# Switch to the nixuser
USER nixuser
WORKDIR /home/nixuser

# Install Nix (Multi-User)
RUN /drip-coffee/install.nix.sh

COPY entrypoint*sh /drip-coffee/
RUN sudo chmod +x -R /drip-coffee/

ENTRYPOINT ["/drip-coffee/entrypoint.sh"]

