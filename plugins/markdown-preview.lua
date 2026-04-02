vim.pack.add {
  "https://github.com/iamcco/markdown-preview.nvim",
}

-- Disable default browser handling
vim.g.mkdp_browser = ""

-- Custom browser function (Lua wrapper around Vimscript)
vim.cmd([[
  function! OpenMarkdownPreview(url)
    execute "silent ! chromium --app=" . a:url . " &"
  endfunction
]])

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

-- Your existing settings (unchanged)
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_open_ip = ""
vim.g.mkdp_echo_preview_url = 0

vim.g.mkdp_preview_options = {
  disable_sync_scroll = 0,
  sync_scroll_type = "middle",
  hide_yaml_meta = 1,
  content_editable = false,
  disable_filename = 0,
}

vim.g.mkdp_theme = "dark"

