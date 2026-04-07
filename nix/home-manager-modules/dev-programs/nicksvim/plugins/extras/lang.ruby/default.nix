{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    # pkgs.ruby_3_4
    # pkgs.rubyPackages_3_4.solargraph
    # pkgs.rubyPackages_3_4.rubocop
    # pkgs.rubyPackages_3_4.ruby-lsp
  ];

  programs.nixvim = {
    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        ruby
      ];
    };

    plugins.neotest = {
      adapters.rspec = {
        enable = true;

        settings = {
          ignore_wrapper = false;
        };
      };
    };

    #########################################
    # Solargraph
    #########################################
    lsp.servers.solargraph = {
      enable = true;
      config = {
        filetypes = [
          "ruby"
        ];
        root_markers = [
          "Gemfile"
        ];
        # settings = {
        #   cmd = [
        #     "bundle"
        #     "exec"
        #     "rubocop"
        #     "--lsp"
        #   ];
        # };
      };
    };

    plugins.conform-nvim = {
      settings.formatters_by_ft.ruby = ["rubocop"];
      settings.formatters_by_ft.rb = ["rubocop"];
      settings.formatters.rubocop = {
        command = "bundle exec rubocop";
      };
    };

    #########################################
    # Rubocop
    #########################################
    # home.packages = [
    #   # pkgs.ruby_3_4
    #   pkgs.rubyPackages_3_4.solargraph
    #   # pkgs.rubyPackages_3_4.rubocop
    #   # pkgs.rubyPackages_3_4.ruby-lsp
    # ];
    # lsp.servers.rubocop = {
    #   enable = true;
    #   settings = {
    #     cmd = [
    #       "bundle"
    #       "exec"
    #       "rubocop"
    #       "--lsp"
    #     ];
    #   };
    # };

    # plugins.conform-nvim = {
    #   settings.formatters_by_ft.ruby = ["rubocop"];
    #   settings.formatters_by_ft.rb = ["rubocop"];
    #   settings.formatters.rubocop = {
    #     command = "bundle exec rubocop";
    #   };
    # };
  };
}
