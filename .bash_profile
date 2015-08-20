alias canary="open /Applications/Google\ Chrome\ Canary.app"
alias chrome="open /Applications/Google\ Chrome.app"
alias dash="open /Applications/Dash.app"
alias firefox="open /Applications/Firefox.app"
alias spot="open /Applications/Spotify.app"
alias xcode="open /Applications/Xcode.app"
alias kdiff="open /Applications/kdiff3.app"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH
source /usr/local/bin/virtualenvwrapper.sh
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
