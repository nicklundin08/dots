{pkgs, ...}: {
  home.packages = [
    pkgs.cljfmt
  ];
  programs.nixvim = {
    plugins = {
      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          clojure
        ];
      };

      conform-nvim = {
        settings.formatters_by_ft = {
          clj = ["cljfmt"];
        };
      };
    };
  };
}
