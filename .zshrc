eval "$(starship init zsh)"

HISTORY_IGNORE="(ls|ll|cd|pwd|timemgmt)"

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# vi keybidings
bindkey -v

# Completion setup
# ----------------

# Completion
autoload -U compinit; compinit

eval "$(fzf --zsh)"
eval "$(kubectl completion zsh)"
eval "$(kind completion zsh)"
eval "$(uv generate-shell-completion zsh)"

# Completion options
LS_COLORS="di=1;34:ln=1;36:ex=1;32:*.tar=1;31:*.zip=1;31:*.gz=1;31:*.7z=1;31:*.bz2=1;31:*.xz=1;31:*.jpg=33:*.jpeg=33:*.png=33:*.gif=33:*.mp3=35:*.wav=35:*.avi=35:*.mkv=35:*.pdf=36:*.txt=36:*.sh=1;32"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*:*:git:*' menu select

# fzf widget
bindkey "^R" fzf-history-widget

zle -N fzf-history-widget
zle -N fzf-completion
zle -N fzf-file-widget
zle -N fzf-cd-widget

# Turn on reverse layout and preview
export FZF_CTRL_R_OPTS="--layout=reverse --preview='echo {}' --info=inline"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting of the current command line
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors

# Development setup
# -----------------

alias k='kubectl'
alias la='ls -la --color'
alias ll='ls -l --color'

export PATH=$PATH:~/.cargo/bin:${KREW_ROOT:-$HOME/.krew}/bin:~/go/bin

export GOPRIVATE="dev.azure.com/*"
export GOPROXY="direct"
export GONOPROXY="dev.azure.com/*"
export GONOSUMDB="dev.azure.com/*"

# Colon separated list of kube context files
#export KUBECONFIG=$(find "$HOME/.kube/clusters" -type f \( -name "*.yaml" -o -name "*.yml" -o -name "config" \) | paste -sd: -)

#export MISE_GITHUB_TOKEN=<here comes the real token>

# Load ssh key for dev.azure.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# bun completions
[ -s "/Users/richardjonas/.bun/_bun" ] && source "/Users/richardjonas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# autojump combined with fzf
#j() {
#  if [ $# -eq 0 ]; then
#    cd "$(j -s | awk '{print $2}' | fzf --height 40% --reverse --prompt="Autojump > " +s)"
#  else
#    autojump "$@"
#  fi
#}
