{pkgs, ...}: let
  dotsName = "hm-msi";
in {
  home.sessionVariables = {
    DOTS_BRANCH_NAME = dotsName;
  };
  home.packages = with pkgs; [
    (writeShellScriptBin "dots:rebuild" ''
      nix run home-manager/master -- switch -b backup --flake .#${dotsName}
    '')
  ];
}
