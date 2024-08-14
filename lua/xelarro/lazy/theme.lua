return {
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup({
	-- 			-- Enable transparent background
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd [[colorscheme cyberdream]]
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
	"bluz71/vim-nightfly-colors",
	name = "nightfly",
	lazy = false,
	priority = 1000,
	config = function()
	    vim.cmd [[colorscheme nightfly]]
	end
	},
}
