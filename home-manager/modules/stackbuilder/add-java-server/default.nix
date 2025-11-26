{pkgs, ...}: let
  scriptsDir = ./.;
  fileName = "add_java_server";
  filePath = "${scriptsDir}/${fileName}";
  fileContents = builtins.readFile filePath;
in {
  home.packages = [
    (pkgs.writeShellScriptBin "stackbuilder.${fileName}" fileContents)
  ];
}
