{config, ...}: {
  home.shellAliases = {
    "stackbuilder.add_devenv" = ''
      nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#go"

      echo .direnv >> .gitignore
    '';
  };
}
