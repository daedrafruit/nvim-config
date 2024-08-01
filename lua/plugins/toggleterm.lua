
require("toggleterm").setup{
  open_mapping = [[<leader>ct]],
  name= 'Terminal',
  direction = 'float',
	start_in_insert = true,
  insert_mappings = false,
	terminal_mappings = false,
  float_opts = {
    border = 'curved',
  },
}

--vim.keymap.set('n', '<leader>ct', ':ToggleTerm size=40<CR>', { noremap = true, silent = true })


