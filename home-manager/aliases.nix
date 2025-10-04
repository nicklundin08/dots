{
  home.shellAliases = {
    nxs = "git add . && sudo nixos-rebuild switch --flake .";
    hms = "git add . && home-manager switch --flake .";
    tux = "tmuxp load .";
    ns = "echo \"enter search term\"; read variable_name; echo \"$variable_name\" | xargs nix-search {} --json | jq -s | jq '.[].package_pname' | fzf --bind 'enter:become(nix-shell -p {})'";
    nsh = "nix-search --help";
  };
}
