### Vim setup

Install fonts with

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k\n
p10k
```

Copy `rc-airline` to `.vim`

#### Install COC

```bash
brew install node
```

In Vim after `:PluginInstall` run `:call coc#util#install()` to finish the install.

`:CocInstall coc-go`

