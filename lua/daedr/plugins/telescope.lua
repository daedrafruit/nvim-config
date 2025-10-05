return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = { 
		'<leader>fi',
		'<leader>ff',
		'<leader>fg',
		'<leader>fb',
		'<leader>fh',
		'<leader>fr',
	},
	config = function()
		require('telescope').setup {
			defaults = {
				file_ignore_patterns = { "%.git/", "%.cache/", "%.o" }, -- Ignore .git directories
			},
			pickers = {
				find_files = {
					hidden = false, -- Show hidden files
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					follow = true  -- Follow symlinks
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
		end, { noremap = true, silent = true })

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { noremap = true, silent = true })
	end,
}



