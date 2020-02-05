
call plug#begin('~/.vim/plugged')

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Git
Plug 'tpope/vim-fugitive'

" Erlang
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-tags'

" Rust
Plug 'rust-lang/rust.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" html & css
Plug 'mattn/emmet-vim'

call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls
set number

autocmd FileType yaml setlocal ts=2 sts=2 sw=2

filetype plugin on

noremap <s-left> :bprevious<cr>
noremap <s-right> :bnext<cr>

noremap <f2> :bp\|bd #<cr>
noremap <f5> :!ack --type erlang --nocolor <c-r><c-w><cr>
noremap <f6> :ta <c-r><c-w><cr>

" trailing space removal
nnoremap ,<space> :%s/\s\+$/<cr>
vnoremap ,<space> :s/\s\+$/<cr>

noremap ,n :NERDTree<cr>

:imap <buffer> ;mod defmodule  do<cr>end<esc>kwhi
:imap <buffer> ;fun def  do<cr>end<esc>kwhi
:imap <buffer> ;case case  do<cr>_ -><cr>:ok<cr>end<esc>3kwhi

