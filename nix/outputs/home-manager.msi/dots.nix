{pkgs, ...}: let
  pathPart1 = "/home/nick/.nix-profile/bin";
  pathPart2 = "/nix/var/nix/profiles/default/bin";
  dotsName = "hm-msi";
in {
  home.sessionVariables = {
    DOTS_BRANCH_NAME = dotsName;
  };
  programs.bash.profileExtra = ''
    [[ ":$PATH:" == *":${pathPart1}:"* ]] || export PATH="${pathPart1}:$PATH"
    [[ ":$PATH:" == *":${pathPart2}:"* ]] || export PATH="${pathPart2}:$PATH"
  '';
  home.packages = with pkgs; [
    (writeShellScriptBin "dots:rebuild" ''
      nix run home-manager/master -- switch -b backup --flake .#${dotsName}
    '')
  ];
}
