# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# User configuration
# go environment
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications:/Users/mrbroll/bin:/usr/local/go/bin:/opt/X11/bin:$PATH
export ANDROID_HOME=/Users/mrbroll/android-sdk
# android tools
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$HOME/Work/operations/bin:$PATH
# home dir executables
export PATH=$HOME/bin:$HOME/Applications:$PATH

# node
export NODE_ENV=dev

# text editor
export EDITOR=vim

# Fleet
alias fleetctl="fleetctl -strict-host-key-checking=false"

alias chrome="open /Applications/Google\ Chrome.app"
alias es="elasticsearch"
alias node="node --harmony"
alias pp="fpp"
alias spot="open /Applications/Spotify.app"
alias sql="sqlite3 -column -cmd '.headers on'"
alias wifi="wifi.sh"

bindkey -v
export KEYTIMEOUT=1

# Common wifast aliases
alias gitgraph='git log --graph --pretty=oneline --abbrev-commit'

# file and proc limits
ulimit -n 65536
ulimit -u 2048

export NVM_DIR="/Users/mrbroll/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
