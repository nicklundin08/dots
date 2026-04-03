{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
    };

    # mini-icons = {
    #   enable = true;
    # };

    plugins.noice = {
      enable = true;
      autoLoad = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>snh";
        action = lib.generators.mkLuaInline "function() require('noice').cmd('history') end";
        options = {
          desc = "Noice History";
        };
      }

      #####################################
      # Git
      #####################################
      {
        mode = "n";
        key = "<leader>gpl";
        action = lib.generators.mkLuaInline "function() Snacks.picker.gh_pr() end";
        options = {
          desc = "[g]ithub [p]ull-request [l]ist";
        };
      }
    ];

    plugins.nui = {
      enable = true;
    };

    plugins.snacks = {
      enable = true;
      autoLoad = true;
      settings.input.enabled = true;
      settings.notifier.enabled = true;
      # bigfile = {
      #   enabled = true;
      # };
      # statuscolumn = {
      #   enabled = false;
      # };
      # words = {
      #   enabled = true;
      #   debounce = 100;
      # };
      # quickfile = {
      #   enabled = false;
      # };
      # notifier = {
      #   enabled = true;
      #   timeout = 3000;
      # };
    };
  };
}
