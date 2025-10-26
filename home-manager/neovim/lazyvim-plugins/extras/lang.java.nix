{pkgs, ...}: {
  home.packages = [
    pkgs.lombok
    pkgs.jdt-language-server
  ];

  home.sessionVariables = {
    JDTLS_PATH = "${pkgs.jdt-language-server}";
    LOMBOK_PATH = "${pkgs.lombok}";
    LOMBOK_JAR_PATH = "${pkgs.lombok}/share/java/lombok.jar";
  };

  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-jdtls";
        src = pkgs.fetchFromGitHub {
          owner = "mfussenegger";
          repo = "nvim-jdtls";
          rev = "380ac148f989e1291aac002dc959ecc68c5243d0";
          hash = "sha256-GNSxiiZmPdcU+bNSpnEnoGJ3q//bujxrRD65/V//2U8=";
        };
      })
    ];

    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        java
      ];
    };

    extraFiles = {
      "after/ftplugin/java.lua".source = ./jdtls.lua;
    };

    plugins.neotest = {
      settings.adapters = [
        "gradle"
        #"java"
      ];
    };
  };
  # programs.nixvim.plugins.lspconfig.servers.jdtls.enable = true;

  # keymaps = [
  #   {
  #     action = ":Ex<CR>";
  #     key = "-";
  #     mode = "n";
  #   }
  # ];
}
