-- load project specific .nvimrc or .vimrc files
vim.o.exrc = true
-- restrict unsafe commands in local configs
vim.o.secure = true

-- square border for popups
vim.o.winborder = "single"

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- show line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- tab options
vim.opt.expandtab = true -- use spaces as tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true

-- persistent undo
vim.opt.undofile = true

-- Define the behavior of the Backspace key.
vim.opt.backspace = "indent,eol,start"

-- Show command-line messages, such as when executing commands.
vim.opt.showcmd = true

-- Automatically write the file if it's modified when switching buffers or exiting.
vim.opt.autowrite = true

-- Highlight the current line.
vim.opt.cursorline = true

-- Automatically read the file if it's changed outside of Neovim.
--vim.opt.autoread = true

-- Set the style of the status line.
vim.opt.laststatus = 3
vim.opt.ruler = false

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.statusline = "%=%t%m%R"
  end,
})

-- always show sign column (git signs, error etc on left)
--vim.opt.signcolumn = "yes"
