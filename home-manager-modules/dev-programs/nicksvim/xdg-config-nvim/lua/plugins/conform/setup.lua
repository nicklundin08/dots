require("conform").setup({
	formatters = {
		rubocop = {
			command = "bundle exec rubocop",
		},
	},

	formatters_by_ft = {
		-- Lua
		lua = { "stylua" },

		-- Nix
		nix = { "alejandra" },

		-- Java
		java = { "google-java-format" },

		-- Ruby
		ruby = { "rubocop" },
		rb = { "rubocop" },

		-- Javascript
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
