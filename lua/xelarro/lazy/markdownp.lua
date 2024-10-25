return {
	-- install without yarn or npm
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function(plugin)
		if vim.fn.executable "npx" then
			vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
		else
			vim.cmd [[Lazy load markdown-preview.nvim]]
			vim.fn["mkdp#util#install"]()
		end
	end,
	init = function()
		if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
	end,    config = function()
		vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview, { desc = "Markdown Preview" })
		vim.keymap.set("n", "<leader>ms", vim.cmd.MarkdownPreviewStop, { desc = "Markdown Stop Preview" })
	end
}
