# tools
export PATH="$PATH:$HOME/tools/bin:$HOME/.svm/current/rt/bin"

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

## java
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

## applications bin
export APPLICATION_HOME=~/Applications
export PATH=$APPLICATION_HOME:$PATH

# haskell
export PATH=~/.cabal/bin/:$PATH
