return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      -- Auto start preview when entering markdown buffer
      vim.g.mkdp_auto_start = 0

      -- Auto close preview when leaving markdown buffer
      vim.g.mkdp_auto_close = 1

      -- Refresh only on save / insert leave
      vim.g.mkdp_refresh_slow = 0

      -- Only allow MarkdownPreview for markdown files
      vim.g.mkdp_command_for_global = 0

      -- Do not expose preview server to network
      vim.g.mkdp_open_to_the_world = 0

      -- Custom IP (empty = localhost)
      vim.g.mkdp_open_ip = ""

      -- Custom browser (empty = default)
      vim.g.mkdp_browser = ""

      -- Echo preview URL in command line
      vim.g.mkdp_echo_preview_url = 0

      -- Custom browser function
      vim.g.mkdp_browserfunc = ""

      -- Preview options
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }

      -- Custom CSS
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""

      -- Custom port (empty = random)
      vim.g.mkdp_port = ""

      -- Page title
      vim.g.mkdp_page_title = "「${name}」"

      -- Images path
      vim.g.mkdp_images_path = "/home/user/.markdown_images"

      -- Recognized filetypes
      vim.g.mkdp_filetypes = { "markdown" }

      -- Theme
      vim.g.mkdp_theme = "dark"

      -- Combine preview window
      vim.g.mkdp_combine_preview = 0
      vim.g.mkdp_combine_preview_auto_refresh = 1
    end,
  },
}

