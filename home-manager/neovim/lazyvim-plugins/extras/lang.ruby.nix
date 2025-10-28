{pkgs, ...}: {
  home.packages = [
    pkgs.ruby-lsp
    pkgs.rubocop
  ];

  # home.sessionVariables = {
  #   JDTLS_PATH = "${pkgs.jdt-language-server}";
  #   LOMBOK_PATH = "${pkgs.lombok}";
  #   LOMBOK_JAR_PATH = "${pkgs.lombok}/share/java/lombok.jar";
  # };

  programs.nixvim = {
    plugins = {
      lsp.servers.ruby_lsp.enable = true;
      lsp.servers.ruby_lsp.package = "${pkgs.ruby-lsp}";

      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          ruby
        ];
      };

      neotest = {
        adapters.rspec = {
          enable = true;

          settings = {
            ignore_wrapper = false;
          };
        };
      };

      conform-nvim = {
        settings.formatters_by_ft.ruby = ["rubocop"];
      };
    };

    keymaps = [
      #   {
      #     action = lib.generators.mkLuaInline "function() require('jdtls').jshell() end";
      #     key = "<leader>ls";
      #     mode = "n";
      #     options.desc = "Shell";
      #   }
    ];
  };
}
