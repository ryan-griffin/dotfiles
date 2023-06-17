return {
	"decaycs/decay.nvim",
	config = function()
		require("decay").setup({
			style = "dark",
			nvim_tree = {
				contrast = true,
			}
		})
	end,
}
