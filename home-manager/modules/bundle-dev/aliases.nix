{
  home.shellAliases = {
    ########################################
    # HM
    ########################################
    "hm.switch" = "git add . && home-manager switch --flake .";
    "hm.show_host_for_nix" = "echo \"$(whoami)@$(hostname)\"";
    "hm.show_host_for_git" = "echo \"hm/$(whoami)-$(hostname)\""; #git dont like @ symbols
    "hm.create_branch_for_host" = "git branch $(hm.show_host_for_git)";

    ## TODO: dont hardcode bash reload here?
    "hm.increment" = "pre-commit && git commit -a && home-manager switch --flake . && git switch $(hm.show_host_for_git) && git reset --hard main && git switch main && exec bash";

    ssh_nix_tower = "ssh nick@10.0.0.134";
    show_ip = "ip -br addr show";
    nxs = "git add . && sudo nixos-rebuild switch --flake .";
    hms = "git add . && home-manager switch --flake .";
    tux = "tmuxp load .";
    ns = "echo \"enter search term\"; read variable_name; echo \"$variable_name\" | xargs nix-search {} --json | jq -s | jq '.[].package_pname' | fzf --bind 'enter:become(nix-shell -p {})'";
    nsh = "nix-search --help";
  };
}
