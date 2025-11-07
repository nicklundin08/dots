{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    # pkgs.ruby_3_4
    # pkgs.rubyPackages_3_4.rubocop
    # pkgs.rubyPackages_3_4.ruby-lsp
  ];

  programs.nixvim = {
    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        ruby
      ];
    };

    extraFiles = {
      "after/ftplugin/ruby.lua".source = ./ruby.lua;
    };

    plugins.neotest = {
      adapters.rspec = {
        enable = true;

        settings = {
          ignore_wrapper = false;
        };
      };
    };
    lsp.servers.rubocop = {
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
      settings.formatters_by_ft.ruby = ["rubocop"];
    };

    # keymaps = [
    #   {
    #     action = "<cmd>Telescope hoogle<cr>";
    #     key = "<leader>sh";
    #     mode = "n";
    #     options.desc = "[s]earch [h]oogle";
    #   }
    # ];
  };
}
