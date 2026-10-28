{lib, ...}: {
  programs.nixvim.keymaps = [
    #####################################
    # Quit
    #####################################
    {
      key = "<leader>qq";
      action = ":qa<CR>";
      mode = "n";
      options.desc = "Quit all";
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
      action = "<Cmd>BufferLineTogglePin<CR>";
      key = "<leader>bp";
      mode = "n";
      options.desc = "Toggle Pin";
    }
    {
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      key = "<leader>bP";
      mode = "n";
      options.desc = "Delete non-pinned buffers";
    }
    {
      action = "<Cmd>BufferLineCloseOthers<CR>";
      key = "<leader>bo";
      mode = "n";
      options.desc = "Delete other buffers";
    }
    # { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    # { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    # { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    # { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    # { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    # { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    # { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    # { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
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
      options.desc = "Line Diagnostics";
    }
    #####################################
    # Text
    #####################################
    # {
    #   mode = "v";
    #   key = "J";
    #   action = ":m '>+1<CR>gv=gv";
    # }
    # {
    #   mode = "v";
    #   key = "K";
    #   action = ":m '<-2<CR>gv=gv";
    # }
    #####################################
    # Utils
    #####################################
    {
      mode = "n";
      key = "<leader>ulh";
      action = "<cmd>checkhealth vim.lsp<CR>";
      options.desc = "[L]SP [h]ealth";
    }
    {
      mode = "n";
      key = "<leader>ule";
      action = "<cmd>e ~/.local/state/nvim/lsp.log<CR>";
      options.desc = "[L]SP edit log";
    }
    #####################################
    # Misc
    #####################################
    {
      mode = "n";
      key = "<esc><esc>";
      action = ":noh<CR>";
      options.desc = "No highlight";
    }
  ];
}
