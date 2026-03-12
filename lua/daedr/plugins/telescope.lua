return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end },
    { '<leader>fb', function() require('telescope.builtin').buffers() end },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end },
    { '<leader>fr', function() require('telescope.builtin').oldfiles() end },

    { '<Leader>gd', function() require('telescope.builtin').git_status() end },
    { '<Leader>gc', function() require('telescope.builtin').git_commits() end },
    { '<Leader>gb', function() require('telescope.builtin').git_branches() end },
	},
	config = function()
		require('telescope').setup {
			defaults = {
				file_ignore_patterns = { "%.git/", "%.cache/", "%.o" },
				borderchars = {
					prompt = { " ", " ", "─", "│", "│", " ", "─", "└" },
					results = { "─", " ", " ", "│", "┌", "─", " ", "│" },
					preview = { "─", "│", "─", "│", "┬", "┐", "┘", "┴" },
				},
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
		end, { noremap = true, silent = true })
	end,
}



