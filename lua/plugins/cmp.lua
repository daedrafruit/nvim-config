vim.pack.add {
	'https://github.com/hrsh7th/nvim-cmp',

  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',
  'https://github.com/hrsh7th/cmp-cmdline',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/saadparwaiz1/cmp_luasnip',
}

local cmp = require('cmp')
local luasnip = require('luasnip')

require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })

vim.keymap.set({ "n", "i", "s" }, "<Tab>", function() luasnip.jump(1) end)
vim.keymap.set({ "n", "i", "s" }, "<S-Tab>", function() luasnip.jump(-1) end)

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Return>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.confirm({ select = true })
          else
              fallback()
          end
      end),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

  sources = cmp.config.sources({
    { name = 'luasnip', priority = 1000 },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' }

  }, {
    { name = 'buffer' },
  })
})
