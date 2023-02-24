require('plugins')

local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

vim.o.number = true

vim.cmd('colorscheme gruvbox')

vim.g.mapleader = ','
vim.keymap.set('n', '<Leader>n', '<Cmd>NERDTree<CR>')
vim.keymap.set('n', '<F2>', '<Cmd>bp|bd #<CR>')
vim.keymap.set('n', '<F3>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<F4>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<F5>', '<Cmd>Rg <c-r><c-w><CR>')

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')

vim.keymap.set('n', '<Leader>h', '<Cmd><c-w>h<CR>')
vim.keymap.set('n', '<Leader>j', '<Cmd><c-w>j<CR>')
vim.keymap.set('n', '<Leader>k', '<Cmd><c-w>k<CR>')
vim.keymap.set('n', '<Leader>l', '<Cmd><c-w>l<CR>')

vim.keymap.set('v', '<Leader>y', '"*y')

-- LSP key maps
vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', '<Leader>e', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, bufopts)
vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<Leader>m', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<Leader>r', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<Leader>q', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition, bufopts)

