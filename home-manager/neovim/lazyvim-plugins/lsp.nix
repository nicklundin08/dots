{pkgs, ...}: {
  # programs.nixvim.plugins = {
  #   lspconfig = {
  #     enable = true;
  #   };
  # };
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        extra = [
          {
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
          }
          {
            key = "ca";
            action = "vim.lsp.buf.code_action()";
          }
          # {
          #   key = "cd";
          #   action = "vim.lsp.diagnostic()";
          # }
        ];
      };
    };
  };
}
