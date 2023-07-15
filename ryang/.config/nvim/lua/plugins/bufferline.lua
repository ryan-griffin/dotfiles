return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = "Files",
					text_align = "center",
				}
			}
		}
	}
}
