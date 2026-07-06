{
  pkgs,
  inputs,
  ...
}: {
  packages = with pkgs; [
    git
    lazygit
    # fd-find
    curl
    ripgrep
    gcc
    # tree-sitter-cli
    neovim
  ];

  shellHook = ''
    echo "Hello from shell hook!"
  '';
}
