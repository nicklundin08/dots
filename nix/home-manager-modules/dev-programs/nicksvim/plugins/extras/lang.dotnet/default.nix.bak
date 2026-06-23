{pkgs, ...}: let
  mkneotestVstest = import ./neotest-vstest.nix;
  neotest-vstest = mkneotestVstest pkgs;
in {
  home.packages = [
    pkgs.omnisharp-roslyn
  ];

  programs.nixvim = {
    extraConfigLua = ''
      vim.lsp.config('omnisharp', {
        cmd = {
          'OmniSharp',
          '--languageserver',
          '--hostPID',
          tostring(vim.fn.getpid()),
        },
      })

      require("neotest").setup({
        adapters = {
          require("neotest-vstest"),
        },
      })
    '';

    extraPlugins = [
      neotest-vstest
    ];

    plugins = {
      lsp.servers.omnisharp = {
        # :LspInfo
        # :LspLog
        # :lua vim.lsp.set_log_level("debug")

        # Force start
        # :lua vim.lsp.enable("omnisharp")

        # Check if enabled
        # :lua print(vim.inspect(vim.lsp.is_enabled("omnisharp")))

        # :lua print(vim.inspect(vim.lsp.get_clients()))
        # :lua require("lspconfig").omnisharp.manager.try_add()
        # :lua vim.lsp.start({name = "omnisharp",cmd = {"omnisharp"},root_dir = vim.fn.getcwd()})
        # :lua print(vim.inspect(vim.lsp.start({name = "omnisharp",cmd = {"OmniSharp"},root_dir = vim.fn.getcwd()})))
        # :lua print(vim.lsp.get_client_by_id(1).initialized)
        # :lua print(vim.inspect(vim.lsp.get_client_by_id(1)))
        # :lua print(vim.inspect(vim.lsp.get_client_by_id(1)))

        # :lua print(vim.inspect(vim.lsp.config.omnisharp.root_dir(vim.fn.expand("%:p"))))
        # :lua print(vim.inspect(vim.lsp.get_client_by_id(1)))

        enable = true;
        # filetypes = [
        #   "cs"
        #   "sln"
        #   "csproj"
        # ];
        rootMarkers = [
          ".git"
        ];
      };

      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          c_sharp
        ];
      };

      conform-nvim = {
        settings.formatters_by_ft = {
          cs = ["csharpier"];
        };
      };
    };
  };
}
