vim.pack.add { "https://github.com/andymass/vim-matchup" }

vim.g.matchup_treesitter_stopline = 500
vim.g.matchup_treesitter_disable_virtual_text = 1
vim.g.matchup_matchparen_offscreen = {}

-- hack to prevent breaking cmp tab bind
local ok, cmp = pcall(require, "cmp")
if ok then
  cmp.event:on("menu_opened", function() vim.b.matchup_matchparen_enabled = false end)
  cmp.event:on("menu_closed", function() vim.b.matchup_matchparen_enabled = true end)
end
-- end of hack
