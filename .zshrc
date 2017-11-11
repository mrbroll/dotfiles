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

export PATH=$PATH:$HOME/bin

# node
export NODE_ENV=dev

# text editor
export EDITOR=vim
export SYSTEMD_EDITOR=vim

# ALIAS
alias dc="docker-compose"
alias fleetctl="fleetctl --strict-host-key-checking=false"
alias pp="fpp"
alias spotify="spotify --force-device-scale-factor=1.5"
alias sql="sqlite3 -column -cmd '.headers on'"
alias tr="transmission-remote"
alias tf="terraform"
alias g="git"
alias copy="xclip -selection c"
alias auth="authenticator"

bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

# Common wifast aliases
alias gitgraph='git log --graph --pretty=oneline --abbrev-commit'

export NVM_DIR="/home/mrbroll/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#Apparently the bundled python client for cassandra doesn't fking work,
#cuz why would it?
export CQLSH_NO_BUNDLED=true

#direnv hook, cuz it's dope
eval "$(direnv hook zsh)"

#conscript setup
export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"
export PATH=$CONSCRIPT_HOME/bin:$PATH

#make and cd to dir
mkcd() {
    dir=$1
    shift
    mkdir -p "$dir" && cd "$dir"
}

aws-sand() {
    eval $(aws-env-role sand operator)
}

aws-stag() {
    eval $(aws-env-role stag operator)
}

aws-prod() {
    eval $(aws-env-role prod operator)
}

aws-logout() {
    unset $(env | sed -n 's/^\(AWS_[^=]*\)=.*$/\1/p')
}

mongo-zp() {
    vpn zd down && \
    vpn zs down && \
    vpn zp up && \
    mongo mongodb.prod.cntr.io/wifastportal
}

mongo-zs() {
    vpn zd down && \
    vpn zp down && \
    vpn zs up && \
    mongo mongodb.stag.cntr.io/wifastportal
}

mongo-zd() {
    vpn zs down && \
    vpn zp down && \
    vpn zd up && \
    mongo mongodb.sand.cntr.io/wifastportal
}

mongo-shadow() {
    vpn zs down && \
    vpn zd down && \
    vpn zp up
    mongo datasandbox-worker1/wifastportal
}

pants-setup() {
    curl -L -O https://pantsbuild.github.io/setup/pants && chmod +x pants && \
    touch pants.ini && \
    echo "[GLOBAL]\npants_version: $(./pants -V)" > pants.ini
}
