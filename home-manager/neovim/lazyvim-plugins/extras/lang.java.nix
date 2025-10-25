{pkgs, ...}: {
  home.packages = [
    pkgs.lombok
    pkgs.jdt-language-server
  ];

  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "netrw.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "mfussenegger";
          repo = "nvim-jdtls";
          rev = "380ac148f989e1291aac002dc959ecc68c5243d0";
          hash = "sha256-GNSxiiZmPdcU+bNSpnEnoGJ3q//bujxrRD65/V//2U8=";
        };
      })
    ];

    extraFiles = {
      "after/ftplugin/java.lua".source = ./jdtls.lua;
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
