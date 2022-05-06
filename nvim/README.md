## Setup neovim

Download `vim-plug` and place into the autoload directory.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugUpdate +qa
```

Install linters

```bash
brew install fzf

# Install vint vimscript linter
pip install vim-vint

# Install gofumpt
go install mvdan.cc/gofumpt@latest
```
