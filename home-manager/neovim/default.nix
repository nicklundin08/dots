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
    ./plugins/grug-far.nix
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
    '';
    nixpkgs.useGlobalPackages = true;

    plugins.which-key = {
      enable = true;

      # Document existing key chains
      settings = {
        # delay between pressing a key and opening which-key (milliseconds)
        # this setting is independent of vim.opt.timeoutlen
        delay = 0;
        spec = [
          {
            __unkeyed-1 = "<leader>s";
            group = "[S]earch";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "[T]oggle";
          }
          {
            __unkeyed-1 = "<leader>h";
            group = "Git [H]unk";
            mode = [
              "n"
              "v"
              "o"
              "x"
            ];
          }
        ];
      };
    };

    viAlias = true;
    vimAlias = true;
  };
}
