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
	end,
}