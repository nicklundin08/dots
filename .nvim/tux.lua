vim.keymap.set("n", "<leader>zR", function()
	-- local project_config = vim.fn.getcwd() .. "/.nvim.lua"
	local tux_config = vim.fn.getcwd() .. "/.nvim/tux.lua"
	if vim.fn.filereadable(tux_config) == 1 then
		vim.cmd("lua dofile('" .. tux_config .. "')")
		print("Tux config reloaded!")
	else
		print("No tux found in current working directory.")
	end
end, { desc = "Reload tux config" })
-----------------------------------
-- Test
-----------------------------------
vim.keymap.set("n", "<leader>za", function()
	vim.fn.system([[tmux send-keys -t tests "task flake:check" Enter \; select-window -t tests]])
end, { desc = "Test [a]ll and switch" })

vim.keymap.set("n", "<leader>zA", function()
	vim.fn.system([[tmux send-keys -t tests "task flake:check" Enter \;]])
end, { desc = "Test [A]ll" })

-----------------------------------
-- Format
-----------------------------------
vim.keymap.set("n", "<leader>zf", function()
	vim.fn.system([[tmux send-keys -t tests "task fmt:all" Enter \; select-window -t tests]])
end, { desc = "Format and switch" })

vim.keymap.set("n", "<leader>zF", function()
	vim.fn.system([[tmux send-keys -t tests "task fmt:all" Enter \;]])
end, { desc = "Format" })

-----------------------------------
-- REPL
-----------------------------------
vim.keymap.set("n", "<leader>zr", function()
	vim.fn.system([[tmux send-keys -t repl "task repl" Enter \; select-window -t repl]])
end, { desc = "Repl and switch" })

-----------------------------------
-- Server
-----------------------------------

-- No server for this project

-----------------------------------
-- Increment
-----------------------------------
vim.keymap.set("n", "<leader>zi", function()
	vim.fn.system([[tmux send-keys -t tests "task increment" Enter \; select-window -t tests]])
end, { desc = "Increment" })
