
" Standard tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls

" Turn on line numbering
set number

" Color schema
set termguicolors
set background=light
"colorscheme deep-space
colorscheme nova

" Statusline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2

" ctrlp plugin setup
let g:ctrlp_custom_ignore = '\v[\/]\.(git|eunit)$'

" Plugins
"set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-tags'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" customize html mode
au FileType html setlocal shiftwidth=2 tabstop=2

syntax on

" buffer shortcupts
noremap <f2> :bdelete<cr>
noremap <f3> :CtrlPBuffer<cr>
noremap <f4> :call VimErlangTagsSelect(0)<cr><c-]>
noremap <d-left> :bprevious<cr>
noremap <d-right> :bnext<cr>

" trailing space removal
nnoremap ,<space> :%s/\s\+$/<cr>
vnoremap ,<space> :s/\s\+$/<cr>

