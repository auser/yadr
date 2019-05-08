# export GOENV_ROOT="$HOME/.goenv"
# export PATH="$GOENV_ROOT/bin:$PATH"

# export GOROOT=$HOME/go
# export GOBIN=$GOROOT/bin
# export PATH=$PATH:$GOROOT/bin

# eval "$(goenv init -)"
eval "$(direnv hook $SHELL)"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# gvm pkgset use global
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

[[ -f /usr/local/bin/direnv ]] && eval "$(direnv hook $SHELL)"

use_go(){
 . $GVM_ROOT/scripts/gvm-default
 gvm use $1
}
# git clone git@github.com:olebedev/go-starter-kit.git $GOPATH/src/github.com/

#export GOPATH="$HOME/go"
#export GOPATH=$(go env GOPATH)
#export PATH="$GOPATH/bin:$PATH"
#export PATH=$PATH:$GOPATH/bin
#autoload -U compinit && compinit

use_go 1.12.1
