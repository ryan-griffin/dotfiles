return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = "",
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" }
			}
		})
	end
}
