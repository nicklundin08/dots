{pkgs, ...}: let
  neotest-vstest = (import ./neotest-vstest.nix) pkgs;
  roslyn-ls = (import ./roslyn-ls.nix) pkgs;
  neotestLua = builtins.readFile ./neotest-vstest.lua;
  roslynLsLua = builtins.readFile ./roslyn-ls.lua;
  extraConfigLua = neotestLua + roslynLsLua;
in {
  home.packages = [
    pkgs.omnisharp-roslyn
  ];

  programs.nixvim = {
    extraConfigLua = extraConfigLua;

    extraPlugins = [
      neotest-vstest
      roslyn-ls
    ];

    filetype = {
      extension = {
        cs = "cs";
        cshtml = "razor";
        razor = "razor";
      };
    };

    plugins = {
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
