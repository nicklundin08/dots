{
  lib,
  pkgs,
  config,
  ...
}: let
  # Helper function to transform an array of attr sets into a single attr set
  reduceAttrsList = builtins.foldl' (a: b: a // b) {};
  srcDir = ./xdg-config;
  srcFiles = builtins.attrNames (builtins.readDir srcDir);
  mkConfigFile = {file}: {"taskfiles/dots/${file}".source = file;};
  xdgFiles = reduceAttrsList (builtins.map mkConfigFile srcFiles);
in {
  options = {
    dots.enable = lib.mkEnableOption "Adds some various taskfiles in the XDG_CONFIG/taskfile/* dir that contain helper modules for dealing with dots";
  };

  config = lib.mkIf config.dots.enable {
    home.packages = [
      pkgs.go-task
    ];

    xdg.configFile = xdgFiles;
  };
}
