return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview, { desc = "Markdown Preview" })
        vim.keymap.set("n", "<leader>ms", vim.cmd.MarkdownPreviewStop, { desc = "Markdown Stop Preview" })
    end
}
