{
  home.shellAliases = {
    ssh_nix_tower = "ssh nick@10.0.0.134";
    show_ip = "ip -br addr show";
    nxs = "git add . && sudo nixos-rebuild switch --flake .";
    hms = "git add . && home-manager switch --flake .";
    tux = "tmuxp load .";
    ns = "echo \"enter search term\"; read variable_name; echo \"$variable_name\" | xargs nix-search {} --json | jq -s | jq '.[].package_pname' | fzf --bind 'enter:become(nix-shell -p {})'";
    nsh = "nix-search --help";
  };
}
