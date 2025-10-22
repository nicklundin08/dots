{pkgs, ...}: {
  # programs.nixvim.plugins = {
  #   lspconfig = {
  #     enable = true;
  #   };
  # };
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
    };
  };
}
