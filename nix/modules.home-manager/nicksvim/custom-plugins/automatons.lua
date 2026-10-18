local M = {}

M.and_exit = " && exit"

M.and_hang = ' && echo -e "\\e[32m\r\n\tTask completed successfully. Press any key to exit.\\e[0m"' .. "&& read input"

function M.bind(mode, keybind, cmd, desc)
	vim.keymap.set(mode, keybind, function()
		require("toggleterm").exec(cmd, 1, nil, nil, "float", "false")
	end, { desc = desc })
end

function M.bind_reload(config_relative_path)
	vim.keymap.set("n", "<leader>ur", function()
		local config_full_path = vim.fn.getcwd() .. config_relative_path
		if vim.fn.filereadable(config_full_path) == 1 then
			vim.cmd("lua dofile('" .. config_full_path .. "')")
			print("Project-specific config reloaded!")
		else
			print("No project-specific found in current working directory.")
		end
	end, { desc = "Reload project-specific config" })
end

return M
