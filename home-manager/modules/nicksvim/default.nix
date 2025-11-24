{
  inputs,
  lib,
  ...
}: let
  luaDir = ./lua;
  files = builtins.attrNames (builtins.readDir luaDir);
  readFile = file: builtins.readFile "${luaDir}/${file}";
  fileContents = builtins.map readFile files;
  extraLua = lib.strings.concatStrings fileContents;
in {
  # Import all your configuration modules here
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  #home.file.".config/nvim/lua/customlua".source = ./customlua;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    viAlias = true;
    vimAlias = true;

    #extraConfigLua = builtins.readFile ./autocmd.lua;
    extraConfigLua = extraLua;
  };
}
