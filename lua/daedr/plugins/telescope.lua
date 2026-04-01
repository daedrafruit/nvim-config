return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end,            desc = 'find files' },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end,             desc = 'live grep' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end,               desc = 'buffers' },
    { '<leader>f?', function() require('telescope.builtin').help_tags() end,             desc = 'help tags' },
    { '<leader>fr', function() require('telescope.builtin').oldfiles() end,              desc = 'recent files' },
    { '<leader>fs', function() require('telescope.builtin').lsp_document_symbols() end,  desc = 'document symbols' },
    { '<leader>fk', function() require('telescope.builtin').keymaps() end,               desc = 'keymaps' },

    { '<Leader>gd', function() require('telescope.builtin').git_status() end,            desc = 'git status' },
    { '<Leader>gc', function() require('telescope.builtin').git_commits() end,           desc = 'git commits' },
    { '<Leader>gb', function() require('telescope.builtin').git_branches() end,          desc = 'git branches' },
	},
	config = function()
		require('telescope').setup {
			defaults = {
				file_ignore_patterns = { "%.git/", "%.cache/", "%.o" },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
					i = {
						--disable "insert" mode, close with esc
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

		--show hidden/ignored files
		vim.keymap.set('n', '<leader>fi', function()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
				no_ignore_parent = true,
			})
		end, { noremap = true, silent = true, desc = 'find all files (w/ ignored)' })
	end,
}



