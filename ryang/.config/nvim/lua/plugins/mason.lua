return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	},
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers {
			function(server_name)
				require("lspconfig")[server_name].setup {}
			end,
		}
	end
}
