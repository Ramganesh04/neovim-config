return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" , "clangd", "gopls"},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilites = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilites = capabilites
			})
			lspconfig.tsserver.setup({
				capabilites = capabilites
			})
			lspconfig.eslint.setup({
				capabilites = capabilites
			})
			lspconfig.clangd.setup({
				capabilites = capabilites
			})
			lspconfig.gopls.setup({
				capabilites = capabilites
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	},
}
