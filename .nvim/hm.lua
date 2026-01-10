-- ===========================================================
-- Example .nvim.lua
-- Purpose is to show how project specific keybinds can be set up
-- ===========================================================

-- vim.keymap.set('n', '<leader>r', ':!make run<CR>', { desc = 'Run project' })
vim.keymap.set('n', '<leader>zhr', ':botright vsplit | terminal hm.rebuild<CR>', { desc = 'Rebuild with home manager' })
vim.keymap.set('n', '<leader>zhi', ':botright vsplit | terminal hm.increment<CR>', { desc = 'Increment with home manager' })
