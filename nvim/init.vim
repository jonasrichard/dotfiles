
call plug#begin('~/.vim/plugged')

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Best git plugin ever
Plug 'tpope/vim-fugitive'

" ALE linter
Plug 'w0rp/ale'

" Elixir
Plug 'elixir-editors/vim-elixir'

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

" Theme selection and powerline symbols
set background=dark
colorscheme gruvbox
let g:airline_theme='simple'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace = 'Ξ'

" Turn on line numbering
set number

" Standard tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls

filetype plugin indent on
syntax on

" ALE Go config

let g:ale_elixir_elixir_ls_release = expand("~/Applications/elixir-ls/rel")
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 'always'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'elixir': ['mix_format'],
  \ 'go': ['gofmt', 'goimports'],
  \ 'rust': ['rustfmt'],
  \ }
let g:ale_linters = {
  \ 'elixir': ['elixir-ls'],
  \ 'go': ['gopls', 'golangci-lint'],
  \ 'rust': ['analyzer'],
  \ }

" TODO check what is this!
set completeopt=menu,menuone,preview,noselect,noinsert

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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

nnoremap <leader>w :w<cr>
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
nnoremap <leader>q :ALEHover<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

tnoremap <Esc> <C-\><C-n>

augroup go
    autocmd!
    autocmd FileType go :iabbrev <buffer> _errr if err != nil {<cr>return err<cr>}<up><end>
    autocmd FileType go :iabbrev <buffer> _errp if err != nil {<cr>panic(err)<cr>}<up><end>
    autocmd FileType go :iabbrev <buffer> _erre if err := x(); err != nil {<cr>return err<cr>}<up><end>
    autocmd FileType go nnoremap <localleader>/ I//<esc>
augroup END

" Map jump key in help
autocmd FileType help nnoremap <leader>g <c-]>

" Set indent 2 for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
