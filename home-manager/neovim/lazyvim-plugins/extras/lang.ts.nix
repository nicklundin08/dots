{pkgs, ...}: {
  home.packages = [pkgs.vtsls];
  programs.nixvim.plugins.lsp.servers.vtsls.enable = true;
}
