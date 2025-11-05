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
        ];
      };
    };
  };
}

# vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
#   vim.lsp.diagnostic.on_publish_diagnostics, {
#     virtual_text = true, -- Display diagnostic messages as virtual text
#     signs = true,        -- Display diagnostic signs in the sign column
#     update_in_insert = false, -- Don't update diagnostics in insert mode
#     underline = true,    -- Underline code with diagnostics
#     severity_limit = "Hint", -- Set the minimum severity level to display (e.g., "Error", "Warning", "Info", "Hint")
#   }
# )
