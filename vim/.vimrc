set nocompatible
filetype off

" set runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" add fzf to the path
set rtp+=/usr/local/opt/fzf

" For the move plugin
let g:move_key_modifier = 'C'

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" nice statusbar
Plugin 'vim-airline/vim-airline'

" fzf
Plugin 'junegunn/fzf.vim'

" Git
Plugin 'tpope/vim-fugitive'

" ALE linter
Plugin 'w0rp/ale'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

" Erlang
"Plugin 'vim-erlang/vim-erlang-compiler'
"Plugin 'vim-erlang/vim-erlang-omnicomplete'
"Plugin 'vim-erlang/vim-erlang-runtime'
"Plugin 'vim-erlang/vim-erlang-tags'

" Elixir
"Plugin 'elixir-lang/vim-elixir'

" Go
"Plugin 'fatih/vim-go'

" Ruby
"Bundle 'vim-ruby/vim-ruby'

" html & css
"Plugin 'mattn/emmet-vim'

" typescript
"Plugin 'leafgarland/typescript-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" buffer tab
Plugin 'ap/vim-buftabline'

" Nice color scheme
Plugin 'morhetz/gruvbox'

" Move plugin
Plugin 'matze/vim-move'

" Date manipulation
Plugin 'tpope/vim-speeddating'

call vundle#end()

source ~/.vim/rc-airline

" ALE Go config
let g:ale_completion_enabled = 1
let g:ale_fixers = {
  \ 'go': ['gofmt', 'goimports'],
  \ }
let g:ale_linters = {
  \ 'go': ['gobuild', 'golangserver', 'golangci-lint'],
  \ }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" customize html mode
au FileType html setlocal shiftwidth=2 tabstop=2

" enable :find command wildcards
set path+=**
set wildmenu

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

:let mapleader = ","

" buffer shortcupts
nnoremap <f2> :bp\|bd #<cr>
nnoremap <f3> :CtrlPBuffer<cr>
nnoremap <f4> :call VimErlangTagsSelect(0)<cr><c-]>
nnoremap <s-left> :bprevious<cr>
nnoremap <s-right> :bnext<cr>
nnoremap <f5> :Rg <c-r><c-w><cr>
nnoremap <f6> :ta <c-r><c-w><cr>

" trailing space removal
nnoremap <leader><space> :%s/\s\+$/<cr>
vnoremap <leader><space> :s/\s\+$/<cr>

nnoremap <leader>n :NERDTree<cr>

nnoremap <leader>c "*y<cr>
inoremap <c-x> <esc>ddi
inoremap <c-k> <esc>yykpi
inoremap <c-j> <esc>yypi

nnoremap <leader>v :vertical resize +5<cr>
nnoremap <leader>V :vertical resize -5<cr>
nnoremap <leader>h :resize +5<cr>
nnoremap <leader>H :resize -5<cr>

nnoremap <leader>d :ALEGoToDefinition<cr>
nnoremap <leader>f :ALEFix<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"vnoremap s" <esc>`>a"<esc>`<i"<esc>

autocmd FileType elixir :imap <buffer> ;mod defmodule  do<cr>end<esc>kwhi
autocmd FileType elixir :imap <buffer> ;fun def  do<cr>end<esc>kwhi
autocmd FileType elixir :imap <buffer> ;case case  do<cr>_ -><cr>:ok<cr>end<esc>3kwhi

autocmd FileType go :imap <buffer> ;err if err != nil {<cr>return err<cr>}<esc>k
autocmd FileType go :imap <buffer> ;errp if err != nil {<cr>panic(err.Error())<cr>}<esc>k
autocmd FileType go nnoremap <leader>/ I//<esc>

" I think vim-go already set these up but let us see
"autocmd FileType go :set noexpandtab copyindent preserveindent softtabstop=0 shiftwidth=4 tabstop=4

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.ex 0r ~/.vim/templates/elixir.ex
    augroup END
endif

function Gotags()
    !/usr/local/bin/gotags -f tags -R .
endfunction

