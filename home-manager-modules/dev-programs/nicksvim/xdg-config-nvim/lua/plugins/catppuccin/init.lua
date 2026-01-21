local plugin = "catppuccin"
require("plugins." .. plugin .. ".keymaps")
require("plugins." .. plugin .. ".setup")
vim.cmd.colorscheme("catppuccin")
