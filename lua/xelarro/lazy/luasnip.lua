return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)

        dependencies = {"rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip"},
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
        config = function()
            require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })
            -- vscode format
            require("luasnip.loaders.from_vscode").lazy_load()
            -- snipmate format
            require("luasnip.loaders.from_snipmate").load()
            -- lua format
            require("luasnip.loaders.from_lua").load()

            vim.api.nvim_create_autocmd("InsertLeave", {
                callback = function()
                    if
                        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not require("luasnip").session.jump_active
                    then
                        require("luasnip").unlink_current()
                    end
                end,
            })
        end,
    }
}
