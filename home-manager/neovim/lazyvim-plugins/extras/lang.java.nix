{pkgs, ...}: {
  home.packages = [
    pkgs.lombok
    pkgs.jdt-language-server
  ];
  programs.nixvim.plugins.lsp.servers.jdtls.enable = true;
}
