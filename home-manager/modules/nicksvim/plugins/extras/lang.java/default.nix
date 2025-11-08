{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./junit.nix
  ];

  home.packages = [
    pkgs.lombok
    pkgs.jdt-language-server
  ];

  home.sessionVariables = {
    JDTLS_PATH = "${pkgs.jdt-language-server}";
    LOMBOK_PATH = "${pkgs.lombok}";
    LOMBOK_JAR_PATH = "${pkgs.lombok}/share/java/lombok.jar";
  };

  # let
  #     myJar = pkgs.fetchurl {
  #       url = "https://example.com/path/to/your/application.jar"; # Replace with your JAR URL
  #       sha256 = "sha256-of-your-jar"; # Replace with the actual SHA256 hash
  #     };
  #   in
  #   pkgs.writeScriptBin "run-my-app" ''
  #     #!${pkgs.bash}/bin/bash
  #     exec ${pkgs.jdk}/bin/java -jar ${myJar} "$@"
  #   ''

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

      # (pkgs.vimUtils.buildVimPlugin {
      #   name = "nvim-jdtls";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "rcasia";
      #     repo = "neotest-java";
      #     rev = "fbdf5c3208007ccef1a8941e1229fc5f872c760e";
      #     hash = "sha256-O1dhq6k8Y7sr9DRo3ER1Kc9N1l2LoELo/cvrMCUZZ4s=";
      #   };
      # })
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
      adapters.java = {
        enable = true;

        settings = {
          ignore_wrapper = false;
        };
      };
    };

    plugins.conform-nvim = {
      settings.formatters_by_ft.java = ["google-java-format"];
    };

    keymaps = [
      {
        action = lib.generators.mkLuaInline "function() require('jdtls').jshell() end";
        key = "<leader>ls";
        mode = "n";
        options.desc = "Shell";
      }
    ];
  };
}
