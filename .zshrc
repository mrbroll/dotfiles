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

export PATH=$HOME/bin:$PATH

export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin

# graalvm binaries
export PATH=$PATH:$HOME/install/graalvm-1.0.0-rc1/bin

# node
export NODE_ENV=dev

# text editor
export EDITOR=vim
export SYSTEMD_EDITOR=vim

# ALIAS
alias bzl="bazel"
alias dc="docker-compose"
alias fleetctl="fleetctl --strict-host-key-checking=false"
alias pp="fpp"
alias spotify="spotify --force-device-scale-factor=1.5"
alias sql="sqlite3 -column -cmd '.headers on'"
alias trcli="transmission-remote-cli"
alias tf="terraform"
alias g="git"
alias copy="xclip -selection c"
alias auth="authenticator"
alias y="yarn"
alias vbmanage="VBoxManage"
alias xc="xclip"

bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

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

#for ensime
export BROWSER="google-chrome-stable %s"

#make and cd to dir
mkcd() {
    dir=$1
    shift
    mkdir -p "$dir" && cd "$dir"
}

pants-setup() {
    curl -L -O https://pantsbuild.github.io/setup/pants && chmod +x pants && \
    touch pants.ini && \
    echo "[GLOBAL]\npants_version: $(./pants -V)" > pants.ini
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

jira-changes() {
    url="https://zenreach.atlassian.net/rest/api/2/search?jql=(status%20changed%20BY%20currentuser()%20after%20-2d)"
    user_pass=mrbroll@zenreach.com:`pass show zenreach.atlassian.net/mrbroll@zenreach.com`
    filter='.issues[] | {"issue": .key, "summary": .fields.summary, "updated":.fields.updated, "new_status":.fields.status.name }'
    curl -u $user_pass -s $url | jq $filter | tee >(cat 1>&2) | copy
}

aws-logout() {
    for v in $(env | sed -n 's/^\(AWS_[^=]*\)=.*$/\1/p')
    do
        unset "$v"
    done
}

aws-login() {
    local env=$1
    local role=$2
    eval $(mfa token aws | aws-env-role $env $role)
}
