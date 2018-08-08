set nocompatible
filetype off

" set runtime path
set rtp+=~/.vim/bundle/Vundle.vim

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-tags'

Plugin 'elixir-lang/vim-elixir'

" html & css
Plugin 'mattn/emmet-vim'
" typescript
Plugin 'leafgarland/typescript-vim'

Plugin 'scrooloose/nerdtree'

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
set termguicolors
set background=light
"colorscheme deep-space
colorscheme nova
" colorscheme scheakur

" Statusline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2

" ctrlp plugin setup
set wildignore+=*.beam
let g:ctrlp_custom_ignore='_build$'

filetype plugin indent on

syntax on

" buffer shortcupts
noremap <f2> :bdelete<cr>
noremap <f3> :CtrlPBuffer<cr>
noremap <f4> :call VimErlangTagsSelect(0)<cr><c-]>
noremap <s-left> :bprevious<cr>
noremap <s-right> :bnext<cr>
noremap <f5> :!ack --type erlang --nocolor <c-r><c-w><cr>

" trailing space removal
nnoremap ,<space> :%s/\s\+$/<cr>
vnoremap ,<space> :s/\s\+$/<cr>

noremap ,n :NERDTree<cr>

noremap <c-f9> :vertical resize +5<cr>
noremap <c-f10> :vertical resize -5<cr>
noremap <c-f11> :resize +5<cr>
noremap <c-f12> :resize -5<cr>

