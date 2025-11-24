-- ===========================================================
-- Example .nvim.lua
-- Purpose is to show how project specific keybinds can be set up
-- ===========================================================

-- vim.keymap.set('n', '<leader>r', ':!make run<CR>', { desc = 'Run project' })

vim.keymap.set('n', '<leader>zhr', ':botright vsplit | terminal hm.rebuild<CR>', { desc = 'Rebuild with home manager' })
vim.keymap.set('n', '<leader>zhi', ':botright vsplit | terminal hm.increment<CR>', { desc = 'Increment with home manager' })

-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*.js',
--   callback = function()
--     print("Entering a JavaScript file in this project!")
--   end
-- })
