{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.scala
    pkgs.sbt
    pkgs.scalafmt
    pkgs.scalafix
    pkgs.metals
  ];

  programs.nixvim.plugins = {
    lsp.servers.metals = {
      enable = true;
      filetypes = [
        "scala"
      ];
    };
    treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      scala
    ];

    conform-nvim = {
      settings.formatters_by_ft.scala = ["scalafmt"];
    };
  };
}
