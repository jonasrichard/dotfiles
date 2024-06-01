local lspconfig = require('lspconfig')

lspconfig.emmet_language_server.setup({
    filetypes = { "css", "html", "javascript", "typescriptreact" },
    showAbbreviationSuggestions = true,
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

lspconfig.lua_ls.setup({
    on_init = function(client)
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = "LuaJIT"
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action)
        vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition)
        vim.keymap.set('n', '<Leader>e', vim.lsp.buf.hover)
        vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format)
        vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation)
        vim.keymap.set('n', '<Leader>m', vim.lsp.buf.rename)
        vim.keymap.set('n', '<Leader>r', vim.lsp.buf.references)
        vim.keymap.set('n', '<Leader>q', vim.lsp.buf.hover)
        vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition)
    end
})

-- Change annotation icons
local signs = { Error = "✘", Warn = "⚠︎", Hint = "☼", Info = "ⓘ" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

