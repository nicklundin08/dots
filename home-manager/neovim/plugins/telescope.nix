{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
    };

    web-devicons = {
      enable = true;
    };
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>sk";
      options.silent = true;
      action = "<cmd>Telescope keymaps<cr>";
    }
    {
      mode = "n";
      key = "<leader>/";
      options.silent = true;
      action = "<cmd>Telescope live_grep<cr>";
    }
    {
      mode = "n";
      key = "<leader><space>";
      options.silent = true;
      action = "<cmd>Telescope find_files<cr>";
    }
  ];
}
