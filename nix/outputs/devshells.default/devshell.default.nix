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
    vimPlugins.lazy-nvim

    oh-my-posh

    tmux
  ];

  shellHook = ''
    eval "$(oh-my-posh init bash --config /Users/nick/.config/oh-my-posh/config.json)"
    echo "Hello from shell hook!"
  '';
}
