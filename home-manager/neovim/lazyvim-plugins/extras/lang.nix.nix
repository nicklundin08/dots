{pkgs, ...}: {
  programs.nixvim = {
    plugins.lsp.servers.nil_ls.enable = true;
    plugins.conform-nvim = {
      settings.formatters_by_ft.nix = ["alejandra"];
    };
  };
}
