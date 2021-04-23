### Vim setup

Install fonts with

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
p10k
```

Copy `rc-airline` to `.vim`

### zsh setup

Install plugins which helps a lot.

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Quick remote env setup

```
curl -O https://raw.githubusercontent.com/jonasrichard/dotfiles/master/vim/.vimrc
curl -o .vim/rc-airline https://raw.githubusercontent.com/jonasrichard/dotfiles/master/vim/rc-airline
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
yum install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
