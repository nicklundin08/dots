{
  programs.nixvim.plugins = {
    vim-dadbod.enable = true;
    vim-dadbod-ui.enable = true;
    vim-dadbod-completion.enable = true;
  };

  # programs.nixvim.keymaps = [
  #   {
  #     mode = "n";
  #     key = "<leader>db";
  #     options.silent = true;
  #     action = "<CMD>DBUIToggle<CR>";
  #   }
  # ];
}
