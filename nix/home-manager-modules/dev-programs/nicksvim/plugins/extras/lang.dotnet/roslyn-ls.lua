    require("roslyn").setup({
      -- Specify the path to your dotnet executable explicitly for Nix isolation consistency
      exe = {
        "dotnet",
        -- Note: If your system uses a globally managed global-tool,
        -- you can point directly to the roslyn-language-server DLL if needed.
      },

      args = {
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
      },

      config = {
        on_attach = function(client, bufnr)
          -- Inject your regular keymaps here (e.g., gd for definition, K for hover)
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,

        capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Hook into autocomplete if using nvim-cmp

        settings = {
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "openFiles",
          },
        },
      },
    })
