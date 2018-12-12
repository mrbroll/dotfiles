# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# go environment
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export PATH=/usr/local/bin:$PATH

export PATH=$HOME/bin:$PATH

# text editor
export EDITOR=vim
export SYSTEMD_EDITOR=vim

# ALIAS
alias bzl="bazel"
alias dc="docker-compose"
alias spotify="spotify --force-device-scale-factor=1.5"
alias tf="terraform"
alias g="git"
if [[ $(type xclip 1> /dev/null) ]]; then
    alias xc="xclip"
    alias copy="xclip -selection c"
fi
alias vbmanage="VBoxManage"

bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

#SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if [[ $(type direnv 1> /dev/null) ]]; then
    #direnv hook, cuz it's dope
    eval "$(direnv hook zsh)"
fi

#make and cd to dir
mkcd() {
    dir=$1
    shift
    mkdir -p "$dir" && cd "$dir"
}

autoload -U +X bashcompinit && bashcompinit

aws-logout() {
    for v in $(env | sed -n 's/^\(AWS_[^=]*\)=.*$/\1/p')
    do
        unset "$v"
    done
}
