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
    pkgs.jq
    pkgs.yq-go
    pkgs.stylua

    # dev tools
    pkgs.tmuxp
    pkgs.lazydocker
    pkgs.docker
    pkgs.lazysql
    pkgs.tmux
    pkgs.go-task
    pkgs.lazycli
    pkgs.pre-commit
    pkgs.commitizen
    pkgs.devenv
    pkgs.xsel
    pkgs.gh
    pkgs.kubectl

    pkgs.nodejs_24
    pkgs.maven
    pkgs.quarkus

    # build tools and transitives
    pkgs.gnumake
    pkgs.gcc
    pkgs.curl
    pkgs.ripgrep
  ];
}
