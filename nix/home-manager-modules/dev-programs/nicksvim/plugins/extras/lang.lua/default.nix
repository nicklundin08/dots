{pkgs, ...}: {
  home.packages = [
    pkgs.stylua
  ];

  programs.nixvim = {
    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        lua
      ];
    };

    plugins.conform-nvim = {
      settings.formatters_by_ft.lua = ["stylua"];
    };
  };
}
