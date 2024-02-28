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

-- This line is needed for installing Packer
local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    -- Collection of common configurations for the Nvim LSP client
    use("neovim/nvim-lspconfig")

    -- Treesitter plugin
    use({
        "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"
    })

    -- Visualize lsp progress
    use({
        "j-hui/fidget.nvim",
        tag = "legacy",
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
    use("mrcjkb/rustaceanvim")

    -- Elixir
    use("elixir-tools/elixir-tools.nvim")

    -- Optional
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")

    -- Some color scheme other then default
    use("morhetz/gruvbox")

    -- Git plugin
    use("tpope/vim-fugitive")

    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    use("nvim-lualine/lualine.nvim")

    use("windwp/nvim-ts-autotag")

    -- https://neovimcraft.com/plugin/akinsho/bufferline.nvim
    use({ 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' })

    use('will133/vim-dirdiff')
end)

