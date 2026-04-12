{pkgs, ...}: {
  home.packages = [
    pkgs.cljfmt
  ];

  xdg.configFile."clojure/deps.edn".source = ./deps.edn;
  xdg.configFile.".clojure/deps.edn".source = ./deps.edn;

  programs.nixvim = {
    plugins = {
      conjure = {
        enable = true;
      };
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
