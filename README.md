## Notes for setup dev env

Install Oh my zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Nerd font

```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

Or for Ubuntu, download the font from [here](https://www.nerdfonts.com/font-downloads).
And copy it to `~/.fonts/` and reload the font cache `fc-cache -fv`.

### Vim setup

Install fonts with

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`. Start a new shell and `p10k configure` runs automatically.

### zsh setup

Install plugins which helps a lot.

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Install autojump

```
brew install autojump
```

Load `asdf` in this way to avoid that in shims there will be canonical path with asdf versions wired.
So after an upgrade everything breaks.

```
# .zshrc
. "$(brew --prefix asdf)/libexec/asdf.sh"
```

### Quick remote env setup

```
curl -O https://raw.githubusercontent.com/jonasrichard/dotfiles/master/vim/.vimrc
curl -o .vim/rc-airline https://raw.githubusercontent.com/jonasrichard/dotfiles/master/vim/rc-airline
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
yum install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Brew packages

```
brew install asdf autojump bat dive duf exa fzf htop neovim ripgrep watch
brew install graphviz rust rust-analyzer
brew install go golangci-lint
brew install jq k9s yq
```
