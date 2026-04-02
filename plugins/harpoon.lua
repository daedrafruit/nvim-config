vim.pack.add {
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = 'harpoon2'
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/telescope.nvim"
}
local harpoon = require('harpoon')
local conf = require("telescope.config").values
harpoon:setup({})
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>H", function() harpoon:list():add() end, { desc = "harpoon add file" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon menu" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "harpoon file 1" })
vim.keymap.set("n", "<leader>!", function() harpoon:list():replace_at(1) end, { desc = "harpoon place at 1" })

vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "harpoon file 2" })
vim.keymap.set("n", "<leader>@", function() harpoon:list():replace_at(2) end, { desc = "harpoon place at 2" })

vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "harpoon file 3" })
vim.keymap.set("n", "<leader>#", function() harpoon:list():replace_at(3) end, { desc = "harpoon place at 3" })

vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "harpoon file 4" })
vim.keymap.set("n", "<leader>$", function() harpoon:list():replace_at(4) end, { desc = "harpoon place at 4" })

vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "harpoon file 5" })
vim.keymap.set("n", "<leader>%", function() harpoon:list():replace_at(5) end, { desc = "harpoon place at 5" })

vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "harpoon file 6" })
vim.keymap.set("n", "<leader>^", function() harpoon:list():replace_at(6) end, { desc = "harpoon place at 6" })

vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "harpoon file 7" })
vim.keymap.set("n", "<leader>&", function() harpoon:list():replace_at(7) end, { desc = "harpoon place at 7" })

vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "harpoon file 8" })
vim.keymap.set("n", "<leader>*", function() harpoon:list():replace_at(8) end, { desc = "harpoon place at 8" })

vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "harpoon file 9" })
vim.keymap.set("n", "<leader>(", function() harpoon:list():replace_at(9) end, { desc = "harpoon place at 9" })

vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end, { desc = "harpoon file 10" })
vim.keymap.set("n", "<leader>)", function() harpoon:list():replace_at(10) end, { desc = "harpoon place at 10" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>b", function() harpoon:list():prev() end, { desc = "harpoon prev file" })
vim.keymap.set("n", "<leader>p", function() harpoon:list():next() end, { desc = "harpoon next file" })
