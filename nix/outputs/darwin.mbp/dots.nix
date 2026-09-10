{pkgs, ...}: let
  dotsName = "darwin-mbp";
in {
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "dots:rebuild" ''
      sudo darwin-rebuild switch --flake .#${dotsName}
    '')
  ];
  environment.variables = {
    DOTS_BRANCH_NAME = dotsName;
  };
}
