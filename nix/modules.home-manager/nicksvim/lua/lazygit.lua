vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazygit",
	callback = function(args)
		-- Map <Esc> to send an actual <Esc> keypress to the underlying terminal,
		-- instead of letting Neovim capture it to exit terminal-insert mode.
		vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = args.buf, nowait = true })
	end,
})
