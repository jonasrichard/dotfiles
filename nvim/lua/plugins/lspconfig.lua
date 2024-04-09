local lspconfig = require('lspconfig')

lspconfig.emmet_language_server.setup({
    filetypes = { "css", "html", "javascript", "typescriptreact" },
    showAbbreviationSuggestions = true,
    showAbbreviationSuggestions = "always",
})

lspconfig.gopls.setup({
	cmd = {"gopls"},
	filetypes = {"go", "gomod"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
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
})

-- Change annotation icons
local signs = { Error = "✘", Warn = "⚠︎", Hint = "☼", Info = "ⓘ" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

