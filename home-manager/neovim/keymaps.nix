{lib, ...}: {
  programs.nixvim.keymaps = [
    #####################################
    # Quit
    #####################################
    {
      key = "<leader>qq";
      action = ":qa<CR>";
      mode = "n";
      options = {
        desc = "Quit all";
      };
    }
    {
      key = "<Escape>";
      action = "<C-\\><C-n><CR>";
      mode = "t";
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
    # Diagnostics
    #####################################
    {
      mode = "n";
      key = "<leader>cd";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      options = {
        desc = "Line Diagnostics";
      };
    }
    #####################################
    # Text
    #####################################
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }
  ];
}
