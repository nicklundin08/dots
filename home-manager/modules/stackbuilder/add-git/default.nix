{pkgs, ...}: let
  scriptsDir = ./.;
  fileName = "add_git";
  filePath = "${scriptsDir}/${fileName}";
  fileContents = builtins.readFile filePath;
in {
  home.packages = [
    (pkgs.writeShellScriptBin "stackbuilder.add_git" fileContents)
  ];
}
