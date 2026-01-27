vim.api.nvim_create_autocmd("TermClose", {
	callback = function()
		if vim.v.event.status == 0 then
			print("Process completed succesfully")
			vim.cmd("bdelete! " .. vim.fn.expand("<abuf>"))
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
