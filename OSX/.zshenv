
# rvm
export PATH="$PATH:$HOME/.rvm/bin"

## pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

## java
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

## applications bin
export APPLICATION_HOME=~/Applications
export PATH=$APPLICATION_HOME:$PATH

# haskell
export PATH=~/.cabal/bin/:$PATH

## python 2.7
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi
