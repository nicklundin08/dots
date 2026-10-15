{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    # plugins.grug-far = {
    #   enable = true;
    # };

    autoCmd = [
      {
        event = "VimEnter";
        callback.__raw = ''
          function()
            require("nvim-tree.api").tree.open()
            vim.cmd("wincmd p")
          end
        '';
      }
    ];
    plugins.flash = {
      enable = true;
    };

    plugins.nvim-tree = {
      enable = true;
    };

    plugins.which-key = {
      enable = true;

      # Document existing key chains
      settings = {
        # delay between pressing a key and opening which-key (milliseconds)
        # this setting is independent of vim.opt.timeoutlen
        delay = 0;
        spec = [
          {
            __unkeyed-1 = "<leader>a";
            group = "automate";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = "buffer";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "code";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "LazyGit";
          }
          {
            __unkeyed-1 = "<leader>k";
            group = "quickfix";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "search";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "test";
          }
          {
            __unkeyed-1 = "<leader>T";
            group = "ToggleTerm";
          }
          {
            __unkeyed-1 = "<leader>sn";
            group = "noice";
          }
          {
            __unkeyed-1 = "<leader>u";
            group = "utils";
          }
        ];
      };
    };

    plugins.gitsigns = {
      enable = true;
    };

    plugins.trouble = {
      enable = true;
    };

    plugins.todo-comments = {
      enable = true;
    };
  };
}
