-- ensure the packer plugin manager is installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- Collection of common configurations for the Nvim LSP client
	use("neovim/nvim-lspconfig")
	-- Visualize lsp progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end
	})

	-- Autocompletion framework
	use("hrsh7th/nvim-cmp")
	use({
		-- cmp LSP completion
		"hrsh7th/cmp-nvim-lsp",
		-- cmp Snippet completion
		"hrsh7th/cmp-vsnip",
		-- cmp Path completion
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		after = { "hrsh7th/nvim-cmp" },
		requires = { "hrsh7th/nvim-cmp" },
	})
	-- See hrsh7th other plugins for more great completion sources!
	-- Snippet engine
	use('hrsh7th/vim-vsnip')
	-- Adds extra functionality over rust analyzer
	use("simrat39/rust-tools.nvim")

	-- Optional
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- Some color scheme other then default
	use("morhetz/gruvbox")

    -- NerdTree
    use("scrooloose/nerdtree")

    use("vim-airline/vim-airline")
    use("vim-airline/vim-airline-themes")
    use("ap/vim-buftabline")
end)

-- the first run will install packer and our plugins
--if packer_bootstrap then
--	require("packer").sync()
--	return
--end

require('rust-config')
require('lsp-config')
require('completion')
require('telescope-config')

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.opt.updatetime = 100

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

-- Change annotation icons
local signs = { Error = "✘", Warn = "⚠︎", Hint = "⛭", Info = "ⓘ" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Rust autocommands
vim.api.nvim_create_augroup("Rust", {})

-- Format Rust files on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = "Rust",
    pattern = {"*.rs"},
    callback = function(ev)
        vim.lsp.buf.format()
    end
})

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.opt.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.cmd('colorscheme gruvbox')

vim.g.mapleader = ','

vim.keymap.set('n', '<Leader>n', '<Cmd>NERDTree<CR>')
vim.keymap.set('n', '<F2>', '<Cmd>bp|bd #<CR>')
vim.keymap.set('n', '<F3>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<F4>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<F5>', '<Cmd>Rg <c-r><c-w><CR>')
-- Close Quickfix window
vim.keymap.set('n', '<Leader>c', '<Cmd>cclose<CR>')

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')

-- Move between windows
vim.keymap.set('n', '<Leader>h', '<c-w>h')
vim.keymap.set('n', '<Leader>j', '<c-w>j')
vim.keymap.set('n', '<Leader>k', '<c-w>k')
vim.keymap.set('n', '<Leader>l', '<c-w>l')

-- Resize windows
vim.keymap.set('n', '<up>', '<Cmd>resize +5<CR>')
vim.keymap.set('n', '<down>', '<Cmd>resize -5<CR>')
vim.keymap.set('n', '<left>', '<Cmd>vertical resize -5<CR>')
vim.keymap.set('n', '<right>', '<Cmd>vertical resize +5<CR>')

vim.keymap.set('v', '<Leader>y', '"*y')
-- Replace without spoiling the yank buffer
vim.keymap.set('x', '<Leader>p', '\"_dP')

-- Telescope mappings
-- search files and search grep
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
