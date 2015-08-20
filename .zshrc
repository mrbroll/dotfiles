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
export PATH=~/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications:/Users/mrbroll/bin:/usr/local/go/bin:/opt/X11/bin:$PATH
ANDROID_HOME=/Users/mrbroll/android-sdk
# android tools
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

#node
export NODE_ENV=dev

export EDITOR=vim

#Docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/mrbroll/.boot2docker/certs/boot2docker-vm

#rbenv
eval "$(rbenv init -)"

# For virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export DISABLE_AUTO_TITLE='true'
source /usr/local/bin/virtualenvwrapper.sh

alias chrome="open /Applications/Google\ Chrome.app"
alias spot="open /Applications/Spotify.app"
alias node="node --harmony"

vs () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

source dnvm.sh
