{pkgs, ...}: let
  scriptsDir = ./scripts;
  files = builtins.attrNames (builtins.readDir scriptsDir);
  mkBin = file: pkgs.writeShellScriptBin file (builtins.readFile "${scriptsDir}/${file}");
  binaries = builtins.map mkBin files;
in {
  home.packages = binaries;
}
