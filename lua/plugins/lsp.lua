return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- (Optional) Manage language servers from NeoVim
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		-- LSP Support
		"neovim/nvim-lspconfig",
		-- Autocomplete
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
	},
	config = function ()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls' },
			handlers = {
				lsp_zero.default_setup,
				lua_ls= function ()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }
								}
							}
						}
					})
				end
			},
		})
	end
}
