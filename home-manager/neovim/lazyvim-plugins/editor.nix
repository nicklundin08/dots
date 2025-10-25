{pkgs, lib, ...}: {
  programs.nixvim = {
    # grug-far = {
    #   enable = true;
    # };

    plugins.flash = {
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
            __unkeyed-1 = "<leader>sn";
            group = "noice";
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
