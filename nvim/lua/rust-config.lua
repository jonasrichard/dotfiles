local function on_attach(client, buffer)
	local opts = {buffer = buffer, remap = false}

	-- LSP key maps
	vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', '<Leader>e', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, opts)
	vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<Leader>m', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<Leader>r', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<Leader>q', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition, opts)
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		on_attach = on_attach,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
}

require("rust-tools").setup(opts)
