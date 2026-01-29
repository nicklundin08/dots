{
  inputs,
  lib,
  options,
  config,
  ...
}: let
  luaDir = ./lua;
  files = builtins.attrNames (builtins.readDir luaDir);
  readFile = file: builtins.readFile "${luaDir}/${file}";
  fileContents = builtins.map readFile files;
  extraLua = lib.strings.concatStrings fileContents;
in {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];
  options = {
    nicksvim.enable = lib.mkEnableOption "Enables nicksvim";
  };

  config = lib.mkIf config.nicksvim.enable {
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
  };
}
