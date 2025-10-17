print("Hello from netrw.lua");

require("netrw").setup({});

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	desc = 'Remap create file in netrw',
	callback = function()
		vim.keymap.set('n', 'n', '%', { remap = true, buffer = true })
	end
});
