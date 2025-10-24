{pkgs, ...}: {
  programs.nixvim.plugins.mini-ai = {
    enable = true;
  };

  programs.nixvim.plugins.mini-pairs = {
    enable = true;
  };

  programs.nixvim.plugins.ts-comments = {
    enable = true;
  };

  programs.nixvim.plugins.lazydev = {
    enable = true;
  };

  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = false;
    settings.sources = [
      {name = "nvim_lsp";}
      #{ name = "path"; }
      #{ name = "buffer"; }
    ];
  };

  programs.nixvim.plugins.cmp-nvim-lsp.enable = true;
  # programs.nixvim.plugins.cmp-path.enable = true;
  # programs.nixvim.plugins.cmp-buffer.enable = true;
}
