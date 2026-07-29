{pkgs, ...}: {
  home.packages = [
    pkgs.python312
    pkgs.black
    pkgs.pyright
    pkgs.uv
  ];

  programs.nixvim = {
    plugins.lsp.servers.pyright = {
      enable = true;
    };

    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        python
      ];
    };

    plugins.conform-nvim = {
      settings.formatters_by_ft.python = ["black"];
    };
  };
}
