{
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.hello
    pkgs.tmuxp
    pkgs.gnumake
    pkgs.gcc
    pkgs.curl
    pkgs.lazydocker
    pkgs.lazysql
    pkgs.tmux
    pkgs.alejandra
    pkgs.go-task
    pkgs.ripgrep
    pkgs.fzf
    pkgs.gh
    pkgs.lazycli
    pkgs.jq
    pkgs.stylua
    pkgs.devenv
    pkgs.yazi
    pkgs.xsel
    pkgs.pre-commit
    # pkgs.zellij
    # pkgs.libyaml
    # pkgs.ruby

    ## TODO: remove these and move them to project specific flakes
    # pkgs.lombok
    # pkgs.clojure
    # pkgs.clojure-lsp
    # pkgs.leiningen
    # pkgs.nodejs_23
    # pkgs.postgresql
    # pkgs.liquibase
    # pkgs.go
    # pkgs.gopls

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
