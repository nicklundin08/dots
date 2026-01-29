{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.haskellPackages.haskell-language-server
  ];

  programs.nixvim = {
    #   {
    #   "luc-tielen/telescope_hoogle",
    #   ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    #   opts = function()
    #     LazyVim.on_load("telescope.nvim", function()
    #       require("telescope").load_extension("ht")
    #     end)
    #   end,
    #   keys = {
    #     {
    #       "<localleader>H",
    #       "<cmd>Telescope hoogle<cr>",
    #       ft = "haskell",
    #       desc = "Hoogle",
    #     },
    #   },
    # }
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "telescope_hoogle";
        src = pkgs.fetchFromGitHub {
          owner = "luc-tielen";
          repo = "telescope_hoogle";
          rev = "14be34fd5c464e3da0992ad094f157b0b8b098f9";
          hash = "sha256-Z7GSENbICkM0q1ojZXOxFEQiytiCrXCiUE/18b20b1Q=";
        };
      })
    ];

    # plugins.haskell-tools = {
    #   enable = true;
    # };
    # plugins.haskell-snippets = {
    #   enable = true;
    # };
    # plugins.luasnip = {
    #   enable = true;
    # };

    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        haskell
      ];
    };

    # extraFiles = {
    #   "after/ftplugin/java.lua".source = ./jdtls.lua;
    # };

    plugins.neotest = {
      adapters.haskell = {
        enable = true;

        settings = {
          ignore_wrapper = false;
        };
      };
    };
    lsp.servers.hls = {
      enable = true;
      # filetypes = [
      #   "javascript"
      #   "javascriptreact"
      #   "javascript.jsx"
      #   "typescript"
      #   "typescriptreact"
      #   "typescript.tsx"
      # ];
    };

    plugins.conform-nvim = {
      settings.formatters_by_ft.haskell = ["fourmolu"];
      settings.formatters_by_ft.cabal = ["cabal_fmt"];
    };

    keymaps = [
      {
        action = "<cmd>Telescope hoogle<cr>";
        key = "<leader>sh";
        mode = "n";
        options.desc = "[s]earch [h]oogle";
      }
    ];
  };
}
