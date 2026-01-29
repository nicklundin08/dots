vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch", -- The highlight group to use (e.g., IncSearch, Visual, Search)
			timeout = 100, -- Duration of the highlight in milliseconds
		})
	end,
})
