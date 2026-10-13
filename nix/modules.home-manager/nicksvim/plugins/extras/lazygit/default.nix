{...}: {
  programs.nixvim = {
    plugins.lazygit.enable = true;
    keymaps = [
      {
        key = "<leader>gg";
        action = ":LazyGit<CR>";
        mode = "n";
        options.desc = "LazyGit";
      }
    ];
  };
}
