return {
	"decaycs/decay.nvim",
	priority = 1000,
	config = function()
		require("decay").setup({
			style = "dark",
			italics = {
				code = false,
				comments = true
			},
			nvim_tree = {
				contrast = true,
			}
		})

		local colors = require("decay.core").get_colors("dark")
		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = colors.blue })
	end
}
