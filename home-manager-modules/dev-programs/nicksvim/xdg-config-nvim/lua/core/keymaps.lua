----------------------------------------
-- Quit
----------------------------------------
vim.keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit all" })
vim.keymap.set("t", "<Escape>", "<C-\\><C-n><CR>")
----------------------------------------
-- Splits
----------------------------------------
vim.keymap.set("n", "<leader>wo", ":only<CR>")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
-- ----------------------------------------
-- -- Buffers
-- ----------------------------------------
vim.keymap.set("n", "<S-h>", ":bprev<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
----------------------------------------
-- Saving
----------------------------------------
vim.keymap.set("v", "<C-s>", "<C-c>:update<CR>")
vim.keymap.set("i", "<C-s>", "<C-O>:update<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
----------------------------------------
-- Explorer
----------------------------------------
-- Replaced by oil.nvim!
-- vim.keymap.set('n', '-', ':Ex<CR>')
-- ----------------------------------------
-- -- Diagnostics
-- ----------------------------------------
--     {
--       mode = "n";
--       key = "<leader>cd";
--       action = "<cmd>lua vim.diagnostic.open_float()<CR>";
--       options.desc = "Line Diagnostics";
--     }
--
