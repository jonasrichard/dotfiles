
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'elixir-lang/vim-elixir'

call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls
set number

autocmd FileType yaml setlocal ts=2 sts=2 sw=2

filetype plugin on

