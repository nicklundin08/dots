require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			".git",
			"venv",
			"__pycache__",
			"%.xlsx",
			"%.jpg",
			"%.png",
			"%.webp",
			"%.pdf",
			"%.odt",
			"%.ico",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
	},
})
