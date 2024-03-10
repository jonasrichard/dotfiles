
require('plugins')

-- the first run will install packer and our plugins
--if packer_bootstrap then
--	require("packer").sync()
--	return
--end

require('settings')
require('keymaps')

require('plugins.aerial')
require('plugins.bufferline')
require('plugins.cmp')
require('plugins.lspconfig')
require('plugins.lualine')
require('plugins.nvim-dap')
require('plugins.nvim-dap-go')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.rustaceanvim')
require('plugins.telescope')

-- Elixir LS setup

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

require("elixir").setup({
    elixirls = {
        cmd = "/Users/richardjonas/projects/elixir/elixir-ls/release/language_server.sh",
    }
})


-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
    group = diag_float_grp,
})

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"

vim.cmd('colorscheme gruvbox')

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "go",
    callback = function(ev)
        vim.cmd("iabbrev _ifp if err != nil {<cr>panic(err)<cr>}")
        vim.cmd("iabbrev _ifr if err != nil {<cr>return err<cr>}")
        vim.cmd("iabbrev _ife if err := x(); err != nil {<cr>return err<cr>}")
    end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "help",
    command = "lua vim.api.nvim_set_keymap('n', '<leader>g', '<C-]>', { noremap = true, silent = true })",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "go",
    command = "iabbrev _errp if err != nil {<cr>panic(err)<cr>}<cr>",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "go",
    command = "iabbrev _errr if err != nil {<cr>return err<cr>}<cr>",
})
