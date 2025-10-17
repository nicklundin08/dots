{
  inputs,
  pkgs,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins/catppuccin.nix
    ./plugins/dadbod.nix
    # ./plugins/grug-far.nix
    ./plugins/jdtls.nix
    ./plugins/lualine.nix
    ./plugins/netrw.nix
    ./plugins/noice.nix
    #./plugins/oil.nix
    ./plugins/snacks.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    #./plugins/yazi.nix
  ];

  home.file.".config/nvim/lua/customlua".source = ./customlua;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    extraConfigLua = ''
      require("customlua.netrw")
      require("customlua.lsp_luals")
    '';
    nixpkgs.useGlobalPackages = true;
    plugins.lsp.enable = true;
    plugins.which-key.enable = true;

    viAlias = true;
    vimAlias = true;
  };
}
