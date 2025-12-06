{pkgs, ...}: {
  home.packages = [
    # misc
    pkgs.cowsay
    pkgs.hello
    pkgs.nix-search-cli

    # dashboards and such
    pkgs.htop

    # formatters
    pkgs.alejandra
    #pkgs.xq-xml
    #pkgs.jq
    pkgs.yq
    pkgs.stylua

    # dev tools
    pkgs.tmuxp
    pkgs.lazydocker
    pkgs.lazysql
    pkgs.tmux
    pkgs.go-task
    pkgs.lazycli
    pkgs.pre-commit
    pkgs.commitizen
    pkgs.devenv
    pkgs.xsel
    pkgs.gh

    pkgs.nodejs_24
    pkgs.maven
    pkgs.quarkus

    # build tools and transitives
    pkgs.gnumake
    pkgs.gcc
    pkgs.curl
    pkgs.ripgrep

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
