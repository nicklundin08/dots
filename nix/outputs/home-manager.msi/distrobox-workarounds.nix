{pkgs, ...}: let
  pathPart1 = "/home/nick/.nix-profile/bin";
  pathPart2 = "/nix/var/nix/profiles/default/bin";
in {
  # Podman setup (manual)
  # sudo ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
  # minikube config set driver podman
  # minikube config set rootless true
  # minikube config set container-runtime containerd
  home.sessionVariables = {
    DISTROBOX_NIX_PATH = "123";
    NIX_CONFIG = "extra-experimental-features = flakes nix-command";
  };
  programs.bash.profileExtra = ''
    [[ ":$PATH:" == *":${pathPart1}:"* ]] || export PATH="${pathPart1}:$PATH"
    [[ ":$PATH:" == *":${pathPart2}:"* ]] || export PATH="${pathPart2}:$PATH"
  '';
  home.packages = with pkgs; [
    (writeShellScriptBin "dots:start-daemon" ''
      sudo /nix/var/nix/profiles/default/bin/nix-daemon &
    '')
  ];
}
