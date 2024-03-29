return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"onsails/lspkind.nvim",
				{
					"L3MON4D3/LuaSnip",
					dependencies = "rafamadriz/friendly-snippets"
				},
				{
					"zbirenbaum/copilot-cmp",
					opts = {}
				}
			}
		},
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
			}
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {}
		},
		{
			"zbirenbaum/copilot.lua",
			event = "InsertEnter",
			opts = {
				suggestion = { enabled = false },
				panel = { enabled = false }
			}
		}
	},

	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						symbol_map = { Copilot = "" }
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = (strings[1] or "")
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					vim.api.nvim_set_hl(0, "CmpItemKindCopilot",
						{ fg = vim.api.nvim_get_hl_by_name("CmpItemKind", true).foreground })

					return kind
				end
			},

			window = {
				documentation = cmp.config.window.bordered()
			},

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "copilot" }
			}, {
				{ name = "buffer" }
			})
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" }
			}
		})

		-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			})
		})

		cmp.event:on(
			"confirm_done",
			require("nvim-autopairs.completion.cmp").on_confirm_done()
		)

		require("luasnip.loaders.from_vscode").lazy_load()

		require("mason").setup()

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local augroup = vim.api.nvim_create_augroup("LspCapabilities", {})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = function(client, buffer)
							if client.supports_method("textDocument/formatting") then
								vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre" }, {
									group = augroup,
									buffer = buffer,
									callback = function()
										vim.lsp.buf.format({ async = false })
									end
								})
							end
						end
					})
				end
			}
		})
	end
}
