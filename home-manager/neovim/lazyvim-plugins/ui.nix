{pkgs, ...}: {
  programs.nixvim.plugins = {
    lualine = {
      enable = true;
    };

    mini-icons = {
      enable = true;
    };

    noice = {
      enable = true;
      autoLoad = true;
    };

    nui = {
      enable = true;
    };

    snacks = {
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
