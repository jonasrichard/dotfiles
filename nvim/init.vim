
call plug#begin('~/.vim/plugged')

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" ALE linter
Plug 'w0rp/ale'

" Nice color scheme
Plug 'morhetz/gruvbox'
" Nerd-tree
Plug 'scrooloose/nerdtree'
" nice statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" buffer tab
Plug 'ap/vim-buftabline'

call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls
set number


filetype plugin indent on
syntax on

let mapleader=","

" buffer shortcupts
nnoremap <f2> :bp\|bd #<cr>
nnoremap <f3> :bprevious<cr>
nnoremap <f4> :bnext<cr>
nnoremap <f5> :Rg <c-r><c-w><cr>

" trailing space removal
nnoremap <leader><space> :%s/\s\+$/<cr>
vnoremap <leader><space> :s/\s\+$/<cr>

" display nerdtree
nnoremap <leader>n :NERDTree<cr>

" copy visual to system clipboard
vnoremap <leader>y "*y
" move line up
inoremap <c-k> <esc>yykpi
" move line down
inoremap <c-j> <esc>yypi

" window navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" window resize
nnoremap <right> :vertical resize -5<cr>
nnoremap <left> :vertical resize +5<cr>
nnoremap <down> :resize -5<cr>
nnoremap <up> :resize +5<cr>

nnoremap <leader>d :ALEGoToDefinition<cr>
nnoremap <leader>f :ALEFix<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

autocmd FileType help nnoremap <leader>g <c-]>

