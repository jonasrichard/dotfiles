## Setup neovim

Download `vim-plug` and place into the autoload directory.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugUpdate +qa
```

Install linters

```bash
brew install fzf lua-language-server

# Install vint vimscript linter
pip install vim-vint

# Install gofumpt
go install mvdan.cc/gofumpt@latest
```

### Migrating to lua

Neovim has `.config/nvim/init.lua` as a config file and `lua` directory as `.config/nvim/lua/`.

```
nvim
# then in vim
:PackerInstall
```

### nvim commands

Checking configuration

```
:checkhealth
```

Search

```
:s/pattern/replacement/flags

flags:
  g  - global
  c  - confirm
  e  - do not show error
  i  - ignore case
  I  - case sensitive search

regions:
  %  - whole file
  $  - last line
  number
  /search-pattern/
  ?back-search?

  20;$           - from line 20 to end of file
  12;/dog/s/x/y  - from line 12 until dog found
```

Replace mode

Press `r` to replace one character and go back to normal mode.

Regex

```
\(c\|p\)arrot\?  - match to parrot, carrot, carro
\w               - match a letter
pa.\+ot          - parrot, patriot

:s/\(cat\) hunting \(mice\)/\2 hunting \1

:help multi      - for qualifiers
```

Args

```
:arg **/*.py   - define arguments
:argdo %s/this/that/ge | update
```

Macros

```
:reg    - list of registers (macros, too)

"ay     - yank to register a
"ap     - paste register a
```

Run macros across multiple files

```
:arg **/* .py
:argdo execute ":normal @a" | update
```

Build support commands

```
:copen  -- open build error window (or linter output window like ALE)
:cnext
:cprevious

:lgrep  -- local grep
:lopen  -- open occurrences window
:lnext
:lprevious
:lwindow
```

Git status plugins `g?` for key help.


Vimdiff

```
do  -- :diffget
dp  -- :diffput
```

Terminal tips

```
:vert term
tnoremap <c-j> <c-w><c-j>
tnoremap <c-k> <c-w><c-k>
tnoremap <c-l> <c-w><c-l>
tnoremap <c-h> <c-w><c-h>
```
