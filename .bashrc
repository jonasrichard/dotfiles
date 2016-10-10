
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export BC_ENV_ARGS=$HOME/.bcrc

alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

export PS1='\[\e[1;32m\]\W \[\e[1;31m\]\u \[\e[0m\]\$ '

# Set JAVA_HOME properly
export JAVA_HOME=$(/usr/libexec/java_home)

# Set Gradle 3
export GRADLE_HOME=~/Applications/gradle-3.0
export PATH=$PATH:$GRADLE_HOME/bin

# Let us activate Erlang
#. ~/kerl/18.2.1/activate

export GOPATH=$HOME/.go

