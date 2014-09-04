# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="clean"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fasd tmux zsh-syntax-highlighting yeoman docker bower command-not-found compleat git-extras npm pip tmuxinator grunt)

source $ZSH/oh-my-zsh.sh

# User configuration


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

# solarized theme
# eval 'dircolors ~/.dircolors'

export TERM=xterm-256color

# git clone https://github.com/seoh/buster.git && cd buster  
# sudo python setup.py install  

## Custom Configuration
### alias sugar
alias vh='sudo vim /etc/hosts'
alias vt='vi ~/.tmux.conf'
alias vz='vi ~/.zshrc'
alias vv='vi ~/.vimrc'
alias vg='vi ~/.gitconfig'
alias vs='vi ~/.ssh/config'

alias gog='cd ~/github'
alias goe='cd ~/.emacs.d'
alias gow='cd ~/Workspace'
alias god='cd ~/Dropbox'
alias godl='cd ~/Downloads'
alias gob='cd ~/Dropbox/Blog'
alias got='cd ~/Dropbox/dotfiles'
alias cdp='git rev-parse && cd "$(git rev-parse --show-cdup)"'

alias gnp="git --no-pager"

alias me='whoami'
alias today='date'

alias dir='nautilus .'

alias tm="tmux"
alias tma='tmux a -t'
alias tmn="tmux new"
alias tmk='tmux kill-session -t'

alias rm='echo "Use trash-cli to remove files instead of rm." false'
alias rmdir='echo "Use trash-cli to remove files instead of rmdir." false'
alias tp='trash-put'
alias tl='trash-list'


alias zsh-count="cut -f2 -d';' $HOME/.zsh_history | sort | uniq -c | sort -nr | head -n 30"

alias hs="history | grep -i $1"

alias svi='sudo vi'
alias smv='sudo mv'
alias service='sudo service'

alias apt-get='sudo apt-get'
alias apt-update='apt-get update'
alias apt-upgrade='apt-get upgrade'
alias apt-dist-upgrade='apt-get dist-upgrade'

alias disk-usage='du -h | sort -h | tail -n 1000'
alias xc="xclip -selection clipboard"
alias fpp='sudo lsof -iTCP -sTCP:LISTEN -n -P'
alias psef="ps -ef | grep"
alias psp="ps -ef | peco"

### git
alias plom="git pull origin master"
alias plod="git pull origin dev"
alias psom="git push oritin master"
alias psod="git push oritin dev"

### emacs
alias emacs-server="emacs --daemon"
alias emacs-client="emacsclient -c"
alias emcl="emacs-client -c ."

### Blog
alias ghost="node $HOME/github/ghost/index.js"
alias busg='buster generate --domain=http://127.0.0.1:2368 --dir=~/Dropbox/Blog/1ambda.github.io' --base='http://1ambda.github.io'  
alias busm=$HOME/Dropbox/Blog/ghost-tools/gen-sitemap.sh
alias busd='buster deploy --dir=~/Dropbox/Blog/1ambda.github.io'  

### path
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
export PATH=~/.composer/vendor/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

### go
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

### fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"

### tmuxinator
export EDITOR=vim

### Functions

gi() {
  curl http://www.gitignore.io/api/$@;
}

desc(){
  USAGE="desc <application> <switch>"
  if [[ "$#" -ne "2" ]]
  then
    echo "Usage: $USAGE"
  else
    man "$1" | sed -n "/ *"$2", -/,+3p"
  fi
}

