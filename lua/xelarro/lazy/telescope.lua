return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
			require('telescope').setup {
				pickers = {
					buffers = {
						initial_mode = 'normal',
						select_current = true,
					},
				},
			}
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>pc', builtin.current_buffer_fuzzy_find, {})
            vim.keymap.set('n', '<leader>tbb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' })
            end, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            -- vim.api.nvim_set_keymap(
            --     "n",
            --     "<space>bp",
            --     ":Telescope file_browser<CR>",
            --     { noremap = true }
            -- )
            -- vim.api.nvim_set_keymap(
            --     "n",
            --     "<space>bc",
            --     ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            --     { noremap = true }
            -- )
            pcall(require('telescope').load_extension, 'fzf')
            require("telescope").load_extension "file_browser"
        end
    },
}
