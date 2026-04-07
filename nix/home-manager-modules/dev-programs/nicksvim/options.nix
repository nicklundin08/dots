{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      # updatetime = 100;
      fileencoding = "utf-8";
      number = true;
      clipboard = "unnamedplus";
      relativenumber = true;
      # shiftwidth = 2;
      # breakindent = true;
      # undofile = true;
      swapfile = false;
      ## Sign column - putting this to always on so LSP generating an error doesnt shift the entire buffer when drawing the gutter in
      scl = "yes";
      # signcolumn = "yes";
      # autoformat = false;
      timeoutlen = 300;
      # splitbelow = true;
      # splitright = true;
      # list = true;
      fillchars = {
        eob = " ";
      };
      # listchars = {
      #   tab = "▸ ";
      #   trail = "·";
      #   eol = "↵";
      #   eob = " ";
      #   space = "·";
      # };
      # inccommand = "split";
      # cursorline = true;
      # scrolloff = 8;
    };
  };
}
