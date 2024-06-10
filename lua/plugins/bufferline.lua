require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      }
    },
--    separator_style = "slant",  
    show_buffer_icons = true,  
    show_buffer_close_icons = true, 
    show_close_icon = true,     
    padding = {
      left = 1,
      right = 1,
    },
  },
  highlights = {
    buffer_selected = {
      gui = "bold",  
    },
  },
}

vim.keymap.set('n', '<leader>g1', '<cmd>lua require("bufferline").go_to(1, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g2', '<cmd>lua require("bufferline").go_to(2, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g3', '<cmd>lua require("bufferline").go_to(3, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g4', '<cmd>lua require("bufferline").go_to(4, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g5', '<cmd>lua require("bufferline").go_to(5, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g6', '<cmd>lua require("bufferline").go_to(6, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g7', '<cmd>lua require("bufferline").go_to(7, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g8', '<cmd>lua require("bufferline").go_to(8, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g9', '<cmd>lua require("bufferline").go_to(9, true)<cr>', { silent = true })
vim.keymap.set('n', '<leader>g$', '<cmd>lua require("bufferline").go_to(-1, true)<cr>', { silent = true })

vim.keymap.set('n', '<leader>gt', '<cmd>:BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<leader>gT', '<cmd>:BufferLineCyclePrev<CR>', { silent = true })

vim.keymap.set('n', '<leader>gn', '<cmd>:BufferLineMoveNext<CR>', { silent = true })
vim.keymap.set('n', '<leader>gp', '<cmd>:BufferLineMovePrev<CR>', { silent = true })






