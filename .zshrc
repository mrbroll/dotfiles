# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# User configuration
# go environment
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export PATH=$PATH:$HOME/.local/bin

# node
export NODE_ENV=dev

# text editor
export EDITOR=vim

# Fleet
alias fleetctl="fleetctl --strict-host-key-checking=false"

alias pp="fpp"
alias sql="sqlite3 -column -cmd '.headers on'"
alias spotify="spotify --force-device-scale-factor=1.5"

bindkey -v
export KEYTIMEOUT=1

# Common wifast aliases
alias gitgraph='git log --graph --pretty=oneline --abbrev-commit'

export NVM_DIR="/home/mrbroll/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
