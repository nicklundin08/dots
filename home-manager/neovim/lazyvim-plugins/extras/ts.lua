local lspconfig = require('lspconfig')

lspconfig.vtsls.setup({
  -- Optional: Define custom commands for vtsls
  cmd = { 'vtsls', '--stdio' },

  -- Optional: Specify filetypes to attach vtsls to
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
  },

  -- Optional: Define root directory patterns for project detection
  root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),

  -- Optional: Configure capabilities (e.g., semantic tokens)
  capabilities = require('cmp_nvim_lsp').default_capabilities(), -- If using nvim-cmp

  -- Optional: Define an on_attach function for buffer-specific keybindings or settings
  on_attach = function(client, bufnr)
    -- Example: Set omnifunc for completion
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Example: Map keybindings for LSP features
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    buf_set_keymap(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- ... other keybindings
  end,

  -- Optional: vtsls-specific settings
  settings = {
    -- Example: Enable tracing for debugging
    typescript = {
      tsserver = {
        enableTracing = false,
        log = "off", -- "off", "verbose", "normal"
      },
    },
    -- ... other vtsls settings
  },
})
