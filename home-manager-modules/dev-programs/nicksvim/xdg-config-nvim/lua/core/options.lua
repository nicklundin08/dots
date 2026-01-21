-- updatetime = 100

vim.o.fileencoding = "utf-8"

vim.o.number = true

vim.o.clipboard = "unnamedplus"

vim.o.relativenumber = true

-- shiftwidth = 2

-- breakindent = true

-- undofile = true

vim.o.swapfile = false

-- Sign column - putting this to always on so LSP generating an error doesnt shift the entire buffer when drawing the gutter in
vim.o.signcolumn = "yes"

-- autoformat = false

vim.o.timeoutlen = 300

-- splitbelow = true

-- splitright = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.opt.fillchars = { eob = " " }

-- list = true
-- listchars = {
--   tab = "▸ "
--   trail = "·"
--   eol = "↵"
--   eob = " "
--   space = "·"
-- }

-- inccommand = "split"

-- cursorline = true

-- scrolloff = 8
