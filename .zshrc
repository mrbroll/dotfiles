# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Homebrew
export HOMEBREW_GITHUB_API_TOKEN=c7923dfa0494d5fef0b9f64edee89637bb590291

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

# local executables
export PATH=$HOME/bin:$PATH

# node
export NODE_ENV=dev

# text editor
export EDITOR=vim

# Docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/mrbroll/.boot2docker/certs/boot2docker-vm

# For virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export DISABLE_AUTO_TITLE='true'
source /usr/local/bin/virtualenvwrapper.sh

alias chrome="open /Applications/Google\ Chrome.app"
alias spot="open /Applications/Spotify.app"
alias node="node --harmony"
alias sql="sqlite3 -column -cmd '.headers on'"
alias pp="fpp"

bindkey -v
export KEYTIMEOUT=1

# for wifast-base

# Common wifast aliases
alias gitgraph='git log --graph --pretty=oneline --abbrev-commit'

# Enable bash completion of ./run
# [ -x /Users/mrbroll/Work/wifast-base/run ] && eval "`/Users/mrbroll/Work/wifast-base/run completion`"
