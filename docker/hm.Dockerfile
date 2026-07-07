# Use a Debian-based image
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y curl sudo bash coreutils bash xz-utils

RUN rm -rf /var/lib/apt/lists/*

# Add a user to simulate multi-user setup
RUN useradd -m -s /bin/bash nixuser && echo "nixuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


COPY hm.entrypoint.sh /hm.entrypoint.sh
COPY hm.install.sh /hm.install.sh
RUN chmod +x /hm.entrypoint.sh
RUN chmod +x /hm.install.sh

# Switch to the nixuser
USER nixuser
WORKDIR /home/nixuser

# Install Nix (Multi-User)
RUN /hm.install.sh

# # Source the Nix environment
# ENV PATH="/home/nixuser/.nix-profile/bin:${PATH}"
# ENV NIX_PATH="/home/nixuser/.nix-defexpr"
# ENV NIX_SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
#
# # Verify Nix installation
# RUN nix-shell -p nix-info --run "nix-info -m"
#

ENTRYPOINT ["/hm.entrypoint.sh"]

