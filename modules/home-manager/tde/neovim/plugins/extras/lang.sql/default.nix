{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    #pkgs.sqlfluff
    pkgs.pgformatter
  ];

  programs.nixvim.plugins = {
    treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      sql
    ];

    conform-nvim = {
      #settings.formatters_by_ft.sql = ["sqlfluff"];
      settings.formatters_by_ft.sql = ["pg_format"];
    };
  };
}
