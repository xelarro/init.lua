return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "ansiblels", "lua_ls", "gopls", "golangci_lint_ls", "bashls", "zls", "pyright"},
			handlers = {
				function(server_name) -- default handler (optional) in the mason-lsp config auto configuration section
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,
				["ansiblels"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.ansiblels.setup {
						capabilities = capabilities,
						settings = {
							ansible = {
								completion = {
									provideRedirectModules = true,
									provideModuleOptionAliases = true,
								}
							}
						},
						filetypes = { 'yaml' },
					}
				end,
				["gopls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.gopls.setup {
						capabilities = capabilities,
						settings = {
							gopls = {
								experimentalPostfixCompletions = true,
								analyses = {
									unusedparams = true,
									shadow = true,
								},
								staticcheck = true,
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralType = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = false,
								},
							},
						}
					}
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,
			}
		})
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
				completion = {
					-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:Pmenu",
					col_offset = -3,
					side_padding = 0,
				},
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
			view = {
				entries = {name = 'custom', selection_order = 'near_cursor' }
			},
			mapping = cmp.mapping.preset.insert({
				['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
				['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
				['<M-CR>'] = cmp.mapping(
					cmp.mapping.confirm {
						-- behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					},
					{ "i", "c" }
				),
				["<C-Space>"] = cmp.mapping.complete(),
				-- Scroll the documentation window [b]ack / [f]orward
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
			}),
			preselect = cmp.PreselectMode.None,
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'mkdnflow' },
				{ name = 'path' },
			}, {
				{ name = 'buffer' },
			}),
		})
		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end
}
