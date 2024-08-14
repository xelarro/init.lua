return {
	'j-morano/buffer_manager.nvim',
	config = function ()
		vim.api.nvim_set_keymap("n", "<leader>b", ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", {silent = true, noremap = true})
		vim.api.nvim_set_keymap("n", "<M-.>", ":lua require('buffer_manager.ui').nav_next()<CR>", {silent = true, noremap = true})
		vim.api.nvim_set_keymap("n", "<M-,>", ":lua require('buffer_manager.ui').nav_prev()<CR>", {silent = true, noremap = true})
	end,
}
