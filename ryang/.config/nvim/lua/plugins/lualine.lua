return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			component_separators = "",
			section_separators = "",
			globalstatus = true,
			disabled_filetypes = { "NvimTree" }
		},
		sections = {
			lualine_b = { "branch" },
			lualine_c = { "diff", "diagnostics" }
		}
	}
}
