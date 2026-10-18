local a = require("automatons")

a.bind("n", "<leader>ac", "cz commit" .. a.and_hang .. a.and_exit, "Committizen")
a.bind("n", "<leader>ai", "task increment" .. a.and_exit, "increment")
a.bind("n", "<leader>ar", "task rebuild" .. a.and_hang .. a.and_exit, "rebuild")
a.bind("n", "<leader>az", "ls" .. a.and_hang .. a.and_exit, "ls")
a.bind("n", "<leader>ar", "task repl" .. a.and_hang .. a.and_exit, "repl")
a.bind_reload("/.nvim/pde.lua")
