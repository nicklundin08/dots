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

    # extraFiles = {
    #   "after/ftplugin/rb.lua".source = ./rb.lua;
    # };

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
      settings = {
        cmd = [
          "bundle"
          "exec"
          "rubocop"
          "--lsp"
        ];
      };

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
      settings.formatters_by_ft.rb = ["rubocop"];
      settings.formatters.rubocop = {
      	command = "bundle exec rubocop";
      };
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
