{lib, ...}: {
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
      options.desc = "Search Keymaps";
      action = "<cmd>Telescope keymaps<cr>";
    }
    {
      mode = "n";
      key = "<leader>sg";
      options.silent = true;
      options.desc = "Search grep";
      action = "<cmd>Telescope live_grep<cr>";
    }
    {
      mode = "n";
      key = "<leader>sf";
      options.silent = true;
      options.desc = "Search files";
      action = "<cmd>Telescope find_files<cr>";
    }
    #####################################
    # FAR
    #####################################
    {
      key = "<leader>sr";
      action = lib.generators.mkLuaInline "function() require('grug-far').open({ transient = true }) end";
      mode = "n";
      options = {
        desc = "Search";
      };
    }
  ];
}
