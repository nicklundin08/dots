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
}
