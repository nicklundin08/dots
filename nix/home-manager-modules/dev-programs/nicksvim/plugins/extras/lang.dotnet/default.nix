{pkgs, ...}: {
  home.packages = [
    pkgs.omnisharp-roslyn
  ];

  programs.nixvim = {
    plugins = {
      lsp.servers.omnisharp = {
       # run this to start
       # :lua print(vim.inspect(vim.lsp.get_clients()))
        enable = true;
        filetypes = [
          "cs"
          "sln"
          "csproj"
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
