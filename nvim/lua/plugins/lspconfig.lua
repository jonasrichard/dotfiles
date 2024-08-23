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

lspconfig.rust_analyzer.setup({
    settings = {
        ["rust_analyzer"] = {
        },
    },
})

-- Rust autocommands
vim.api.nvim_create_augroup("Rust", {})

-- Format Rust files on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = "Rust",
    pattern = {"*.rs"},
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action)
        vim.keymap.set('n', '<Leader>ci', vim.lsp.buf.incoming_calls)
        vim.keymap.set('n', '<Leader>co', vim.lsp.buf.outgoing_calls)
        vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition)
        vim.keymap.set('n', '<Leader>e', vim.lsp.buf.hover)
        vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format)
        vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation)
        vim.keymap.set('n', '<Leader>m', vim.lsp.buf.rename)
        vim.keymap.set('n', '<Leader>r', vim.lsp.buf.references)
        vim.keymap.set('n', '<Leader>q', vim.lsp.buf.hover)
        vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition)

        vim.api.nvim_set_hl(0, '@lsp.type.comment.rust', {})

        vim.keymap.set('n', '<Leader>en', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<Leader>ep', vim.diagnostic.goto_prev)
    end
})

-- Change annotation icons
local signs = { Error = "✘", Warn = "⚠︎", Hint = "☼", Info = "ⓘ" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    -- This is deprecated, use vim.diagnostic.config() instead
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
