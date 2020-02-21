set nocompatible
filetype off

" set runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" add fzf to the path
set rtp+=/usr/local/opt/fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'ctrlpvim/ctrlp.vim'

" fzf
Plugin 'junegunn/fzf.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Erlang
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-tags'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Go
Plugin 'fatih/vim-go'

" Ruby
Bundle 'vim-ruby/vim-ruby'

" html & css
Plugin 'mattn/emmet-vim'

" typescript
Plugin 'leafgarland/typescript-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" buffer tab
Plugin 'ap/vim-buftabline'

" Nice color scheme
Plugin 'morhetz/gruvbox'

call vundle#end()

" customize html mode
au FileType html setlocal shiftwidth=2 tabstop=2

" Standard tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls

" Turn on line numbering
set number

" Color schema
colorscheme gruvbox

let g:NERDTreeNodeDelimiter = "\u00a0"

" Statusline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2

" ctrlp plugin setup
set wildignore+=*.beam
let g:ctrlp_custom_ignore='_build$'

set backspace=indent,eol,start

set guifont=Menlo:h13

filetype plugin indent on

autocmd FileType elixir setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

syntax on

" buffer shortcupts
noremap <f2> :bp\|bd #<cr>
noremap <f3> :CtrlPBuffer<cr>
noremap <f4> :call VimErlangTagsSelect(0)<cr><c-]>
noremap <s-left> :bprevious<cr>
noremap <s-right> :bnext<cr>
noremap <f5> :Rg <c-r><c-w><cr>
noremap <f6> :ta <c-r><c-w><cr>

" trailing space removal
nnoremap ,<space> :%s/\s\+$/<cr>
vnoremap ,<space> :s/\s\+$/<cr>

noremap ,n :NERDTree<cr>

noremap ,V :vertical resize +5<cr>
noremap ,v :vertical resize -5<cr>
noremap ,H :resize +5<cr>
noremap ,h :resize -5<cr>

:imap <buffer> ;mod defmodule  do<cr>end<esc>kwhi
:imap <buffer> ;fun def  do<cr>end<esc>kwhi
:imap <buffer> ;case case  do<cr>_ -><cr>:ok<cr>end<esc>3kwhi

autocmd FileType go :imap <buffer> ;err if err != nil {<cr>return err<cr>}<esc>k

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.ex 0r ~/.vim/templates/elixir.ex
    augroup END
endif
