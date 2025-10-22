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
            __unkeyed-1 = "<leader>s";
            group = "[S]earch";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "[T]oggle";
          }
          {
            __unkeyed-1 = "<leader>h";
            group = "Git [H]unk";
            mode = [
              "n"
              "v"
              "o"
              "x"
            ];
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
