return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'

    use 'preservim/nerdtree'
    use 'morhetz/gruvbox'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'ap/vim-buftabline'
end)
