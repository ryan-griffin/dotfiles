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
				"onsails/lspkind.nvim",
				"windwp/nvim-autopairs",
				{
					"L3MON4D3/LuaSnip",
					dependencies = {
						"saadparwaiz1/cmp_luasnip",
						"rafamadriz/friendly-snippets",
					}
				},
			}
		},
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				{
					"jay-babu/mason-null-ls.nvim",
					event = { "BufReadPre", "BufNewFile" },
					dependencies = {
						"jose-elias-alvarez/null-ls.nvim",
						dependencies = "nvim-lua/plenary.nvim"
					}
				}
			}
		}
	},
	config = function()
		-- Set up nvim-cmp.
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = (strings[1] or "")
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end
			},

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
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
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" }
			}, {
				{ name = "cmdline" }
			})
		})

		cmp.event:on(
			"confirm_done",
			require("nvim-autopairs.completion.cmp").on_confirm_done()
		)

		require("luasnip.loaders.from_vscode").lazy_load() -- friendly-snippets

		-- Set up mason
		require("mason").setup()
		require("mason-lspconfig").setup()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})

		require("mason-null-ls").setup({
			handlers = {}
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = buffer,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end
		})
	end,
}
