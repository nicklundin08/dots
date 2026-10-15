function wrap_cmd(cmd)
    local full_cmd = cmd .. ' && echo -e "\\e[32m\r\n\tTask completed successfully. Press any key to exit.\\e[0m"'
    full_cmd = full_cmd .. " && read input && exit"
    return full_cmd
end

function terminal_keybind(mode, keybind, cmd, desc)
    vim.keymap.set(mode, keybind, function()
	local full_cmd = wrap_cmd(cmd)
        require("toggleterm").exec(full_cmd, 1, nil, nil, "float", "false")
    end, { desc = desc })
end

terminal_keybind('n', '<leader>ac', "cz commit", "Committizen")
terminal_keybind('n', '<leader>ai', "task increment", "increment")
terminal_keybind('n', '<leader>az', "ls", "ls")

vim.keymap.set("n", "<leader>ur", function()
	local config_relative_path = "/.nvim/pde.lua"
	local config_full_path = vim.fn.getcwd() .. config_relative_path
	if vim.fn.filereadable(config_full_path) == 1 then
		vim.cmd("lua dofile('" .. config_full_path .. "')")
		print("Project-specific config reloaded!")
	else
		print("No project-specific found in current working directory.")
	end
end, { desc = "Reload project-specific config" })
