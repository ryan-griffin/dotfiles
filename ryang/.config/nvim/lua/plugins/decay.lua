return {
	"ryan-griffin/decay.nvim",
	priority = 1000,
	config = function()
		require("decay").setup({
			style = "dark",
			italics = {
				code = false,
				comments = false
			},
			nvim_tree = {
				contrast = true,
			}
		})
	end
}
