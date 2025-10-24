{pkgs, ...}: {
  programs.nixvim.plugins = {
    # grug-far = {
    #   enable = true;
    # };

    flash = {
      enable = true;
    };

    which-key = {
      enable = true;

      # Document existing key chains
      settings = {
        # delay between pressing a key and opening which-key (milliseconds)
        # this setting is independent of vim.opt.timeoutlen
        delay = 0;
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            group = "buffer";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "code";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "search";
          }
          {
            __unkeyed-1 = "<leader>u";
            group = "ui";
          }
          {
            __unkeyed-1 = "<leader>x";
            group = "diagnostics";
          }
        ];
      };
    };

    gitsigns = {
      enable = true;
    };

    trouble = {
      enable = true;
    };

    todo-comments = {
      enable = true;
    };
  };
}
