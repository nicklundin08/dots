{pkgs, ...}: {
  home.sessionVariables = {
    DISTROBOX_NIX_PATH = "123";
    NIX_CONFIG = "extra-experimental-features = flakes nix-command";
  };
  # home.sessionPath = [
  #   "/home/nick/.nix-profile/bin"
  #   "/nix/var/nix/profiles/default/bin"
  # ];
  home.packages = with pkgs; [
    (writeShellScriptBin "dots:start-daemon" ''
      sudo /nix/var/nix/profiles/default/bin/nix-daemon &
    '')
  ];
}
