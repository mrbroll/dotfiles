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
alias spot="open /Applications/Spotify.app"
alias node="node --harmony"
alias sql="sqlite3 -column -cmd '.headers on'"
alias pp="fpp"
alias wifi="wifi.sh"

bindkey -v
export KEYTIMEOUT=1

# Common wifast aliases
alias gitgraph='git log --graph --pretty=oneline --abbrev-commit'

# file and proc limits
ulimit -n 65536
ulimit -u 2048
