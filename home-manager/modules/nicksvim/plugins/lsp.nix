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
            options.desc = "[g]o to [d]efinition";
          }
          {
            key = "ca";
            action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
            options.desc = "[c]ode [a]ction";
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

