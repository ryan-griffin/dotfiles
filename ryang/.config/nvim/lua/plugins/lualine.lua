return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("lualine").setup({
			-- theme = "dark-decay",
			options = {
				disabled_filetypes = { "NvimTree" },
			}
		})
	end
}
