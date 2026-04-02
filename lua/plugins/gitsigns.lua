vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }

require("gitsigns").setup({
  signs = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "-" },
    topdelete    = { text = "^" },
    changedelete = { text = "~" },
    untracked    = { text = "|" },
  },
  signs_staged = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "-" },
    topdelete    = { text = "^" },
    changedelete = { text = "~" },
    untracked    = { text = "|" },
  },
  signcolumn = false,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
  watch_gitdir = { follow_files = true },
  auto_attach = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 500,
  },
  update_debounce = 100,
  max_file_length = 40000,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local gs = package.loaded.gitsigns
    if not gs then return end

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
    end

    -- Navigation
    map("n", "]h", gs.next_hunk, "Next hunk")
    map("n", "[h", gs.prev_hunk, "Prev hunk")

    -- Actions
    map("n", "<leader>ss", gs.stage_hunk, "Stage hunk")
    map("n", "<leader>sr", gs.reset_hunk, "Reset hunk")
    map("v", "<leader>ss", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Stage hunk (visual)")
    map("v", "<leader>sr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Reset hunk (visual)")

    map("n", "<leader>sS", gs.stage_buffer, "Stage buffer")
    map("n", "<leader>sR", gs.reset_buffer, "Reset buffer")
    map("n", "<leader>sp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>sb", gs.blame_line, "Blame line")
    map("n", "<leader>gD", gs.diffthis, "Diff this")

    -- Toggles
    map("n", "<leader>sB", gs.toggle_current_line_blame, "Toggle blame")
    map("n", "<leader>sw", gs.toggle_word_diff, "Toggle word diff")

    -- Text object
    map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
  end,
})
