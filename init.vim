
" Standard tab settings
set expandtab
set tabstop=4
set shiftwidth=4

" Turn on line numbering
set number

" Plugins
"set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-erlang/vim-erlang-runtime'

call vundle#end()
filetype plugin indent on

