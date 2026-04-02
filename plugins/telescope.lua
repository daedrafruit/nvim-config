vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "%.git/", "%.cache/", "%.o" },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close
      },
    },
  },
  pickers = {
    find_files = {
      hidden = false,
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      follow = true
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end,            { desc = 'telescope find files' })
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end,             { desc = 'telescope live grep' })
vim.keymap.set('n', '<leader>fb', function() builtin.buffers() end,               { desc = 'telescope buffers' })
vim.keymap.set('n', '<leader>f?', function() builtin.help_tags() end,             { desc = 'telescope help tags' })
vim.keymap.set('n', '<leader>fr', function() builtin.oldfiles() end,              { desc = 'telescope recent files' })
vim.keymap.set('n', '<leader>fs', function() builtin.lsp_document_symbols() end,  { desc = 'telescope document symbols' })
vim.keymap.set('n', '<leader>fk', function() builtin.keymaps() end,               { desc = 'telescope keymaps' })
vim.keymap.set('n', '<Leader>gd', function() builtin.git_status() end,            { desc = 'telescope git status' })
vim.keymap.set('n', '<Leader>gc', function() builtin.git_commits() end,           { desc = 'telescope git commits' })
vim.keymap.set('n', '<Leader>gb', function() builtin.git_branches() end,          { desc = 'telescope git branches' })

vim.keymap.set('n', '<leader>fi', function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  })
end, { noremap = true, silent = true, desc = 'telescope find all files (w/ ignored)' })
