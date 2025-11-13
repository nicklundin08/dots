{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins.nui.enable = true;
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-newfile";
        src = pkgs.fetchFromGitHub {
          owner = "adibhanna";
          repo = "nvim-newfile.nvim";
          rev = "80245143cf30ddd98bd953fdd4b23f985ae624e5";
          hash = "sha256-8GUck2k5KUj1jmg/vc4Cd2+hG4JMzNNtX1JU3GYKIPw=";
        };
      })
    ];

    # keymaps = [
    #   {
    #     action = lib.generators.mkLuaInline "<cmd>NewFile ";
    #     key = "<leader>ln";
    #     mode = "n";
    #     options.desc = "[n]ew file";
    #   }
    # ];
  };
}
