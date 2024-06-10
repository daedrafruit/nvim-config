
-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- show line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- tab options
vim.optexpandtab = true -- use spaces as tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true

-- persistent undo
vim.opt.undofile = true

-- Define the behavior of the Backspace key.
vim.opt.backspace = "indent,eol,start"

-- Show command-line messages, such as when executing commands.
vim.opt.showcmd = true

-- Set the style of the status line.
vim.opt.laststatus = 2

-- Automatically write the file if it's modified when switching buffers or exiting.
vim.opt.autowrite = true

-- Highlight the current line.
vim.opt.cursorline = true

-- Automatically read the file if it's changed outside of Neovim.
vim.opt.autoread = true


