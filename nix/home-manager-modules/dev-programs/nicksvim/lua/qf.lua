vim.keymap.set("n", "<leader>kp", function()
	local buf = vim.api.nvim_get_current_buf()
	local row = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_buf_get_lines(buf, row - 1, row, true)[1]

	vim.fn.setqflist({ {
		bufnr = buf,
		lnum = row,
		text = line,
	} }, "a")
end)

vim.keymap.set("n", "<leader>kc", function()
	vim.fn.setqflist({})
end)

vim.keymap.set("n", "<leader>kl", ":copen")

-- ftplugin qf.lua  - ??
-- vim.keymap.set("n", "<<", function()
--   pcall(vim.cmd.colder)
-- end, { buffer = true })
-- vim.keymap.set("n", ">>", function()
--   pcall(vim.cmd.cnewer)
-- end, { buffer = true })
