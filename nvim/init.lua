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

    use("scrooloose/nerdtree")
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
	require("packer").sync()
	return
end

local function on_attach(client, buffer)
	-- This callback is called when the LSP is atttached/enabled for this buffer
	-- we could set keymaps related to LSP, etc here.
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

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- Add tab support
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	-- Installed sources
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

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
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.o.number = true

vim.cmd('colorscheme gruvbox')

vim.g.mapleader = ','

vim.keymap.set('n', '<Leader>n', '<Cmd>NERDTree<CR>')
vim.keymap.set('n', '<F2>', '<Cmd>bp|bd #<CR>')
vim.keymap.set('n', '<F3>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<F4>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<F5>', '<Cmd>Rg <c-r><c-w><CR>')

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')

vim.keymap.set('n', '<Leader>h', '<c-w>h')
vim.keymap.set('n', '<Leader>j', '<c-w>j')
vim.keymap.set('n', '<Leader>k', '<c-w>k')
vim.keymap.set('n', '<Leader>l', '<c-w>l')

vim.keymap.set('v', '<Leader>y', '"*y')

-- LSP key maps
vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', '<Leader>e', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, bufopts)
vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<Leader>m', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<Leader>r', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<Leader>q', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition, bufopts)
