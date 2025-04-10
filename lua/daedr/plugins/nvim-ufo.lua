return {
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.foldcolumn = '0'

			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zr', require('ufo').openAllFolds)
			--vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
			vim.keymap.set('n', 'zM', ':%foldc<CR>', { noremap = true, silent = true })
			vim.keymap.set('n', 'zm', ':%foldc<CR>', { noremap = true, silent = true })
			--vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
			--vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

			vim.keymap.set('n', '<tab>', 'zak<CR>')

			local handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = '  '  -- Use only a plus sign
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0

					-- Process each chunk of virtual text
					for _, chunk in ipairs(virtText) do
							local chunkText = chunk[1]
							local chunkWidth = vim.fn.strdisplaywidth(chunkText)

							-- Check if the current chunk fits within the target width
							if targetWidth > curWidth + chunkWidth then
									table.insert(newVirtText, chunk)
							else
									-- Truncate the chunk to fit within the remaining width
									chunkText = truncate(chunkText, targetWidth - curWidth)
									local hlGroup = chunk[2]
									table.insert(newVirtText, {chunkText, hlGroup})

									-- Ensure suffix is added without padding
									break
							end
							curWidth = curWidth + chunkWidth
					end

					-- Append the plus sign suffix and return the new virtual text
					table.insert(newVirtText, {suffix, 'MoreMsg'})
					return newVirtText
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				foldfunc = "builtin",
				setopt = true,
			}
			local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}

			require('ufo').setup({
					fold_virt_text_handler = handler
			})

		end,
}
