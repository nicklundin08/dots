{lib, ...}:{
  programs.nixvim.keymaps = [
    #####################################
    # Split explorer
    #####################################
    {
      action = ":Ex<CR>";
      key = "-";
      mode = "n";
    }
    #####################################
    # Splits
    #####################################
    {
      action = ":only<CR>";
      key = "<leader>wo";
      mode = "n";
    }
    {
      action = "<C-W>h";
      key = "<C-h>";
      mode = "n";
    }
    {
      action = "<C-W>j";
      key = "<C-j>";
      mode = "n";
    }
    {
      action = "<C-W>k";
      key = "<C-k>";
      mode = "n";
    }
    {
      action = "<C-W>l";
      key = "<C-l>";
      mode = "n";
    }
    #####################################
    # Buffers
    #####################################
    {
      action = ":bprev<CR>";
      key = "<S-h>";
      mode = "n";
    }
    {
      action = ":bnext<CR>";
      key = "<S-l>";
      mode = "n";
    }
    {
      action = ":bdelete<CR>";
      key = "<leader>bd";
      mode = "n";
    }
    #####################################
    # Saving
    #####################################
    {
      action = "<C-c>:update<CR>";
      key = "<C-s>";
      mode = "v";
    }
    {
      action = "<C-O>:update<CR>";
      key = "<C-s>";
      mode = "i";
    }
    {
      action = ":w<CR>";
      key = "<C-s>";
      mode = "n";
    }
    #####################################
    # FAR
    #####################################
    {
      key = "<leader>r";
      action = lib.generators.mkLuaInline "function() require('grug-far').open({ transient = true }) end";
      mode = "n";
      options = {
        desc = "Search";
      };
    }
  ];
}
