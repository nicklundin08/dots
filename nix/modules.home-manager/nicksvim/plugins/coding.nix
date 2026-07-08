{pkgs, ...}: {
  programs.nixvim.plugins.mini-ai = {
    enable = true;
  };

  programs.nixvim.plugins.mini-pairs = {
    enable = true;
  };

  programs.nixvim.plugins.ts-comments = {
    enable = true;
  };

  programs.nixvim.plugins.lazydev = {
    enable = true;
  };

  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = false;
    settings.sources = [
      {name = "nvim_lsp";}
      #{ name = "path"; }
      #{ name = "buffer"; }
    ];

    settings.formatting.format = ''
      function(entry, vim_item)
        -- Set the 'menu' field of the vim_item to the source name
        vim_item.menu = entry.source.name
        return vim_item
      end
    '';
    settings. mapping = {
      # "<C-d>" = "cmp.mapping.scroll_docs(-4)";
      # "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.close()";
      "<C-n>" = "cmp.mapping.select_next_item()";
      "<C-p>" = "cmp.mapping.select_prev_item()";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      # "<C-n>" = {
      #   modes = ["i" "s"];
      #   action = "cmp.mapping.select_next_item()";
      # };
      # "<C-p>" = {
      #   modes = ["i" "s"];
      #   action = "cmp.mapping.select_prev_item()";
      # };
      # "<CR>" = "cmp.mapping.confirm({ select = true })";
    };
  };

  programs.nixvim.plugins.cmp-nvim-lsp.enable = true;
  # programs.nixvim.plugins.cmp-path.enable = true;
  # programs.nixvim.plugins.cmp-buffer.enable = true;
}
