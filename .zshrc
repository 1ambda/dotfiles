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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
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
alias vz='vi ~/.zshrc'
alias vv='vi ~/.vimrc'

alias gg='cd ~/github'

alias me='whoami'

alias tma='tmux a -t'
alias tmk='tmux kill-sessions -t'

### Blog
alias ghost="node $HOME/github/ghost/index.js"
alias busg='buster generate --domain=http://127.0.0.1:2368 --dir=~/Dropbox/Blog/1ambda.github.io' --base='http://1ambda.github.io'  
alias busm=$HOME/Dropbox/Blog/ghost-tools/gen-sitemap.sh
alias busd='buster deploy --dir=~/Dropbox/Blog/1ambda.github.io'  

### SSH
alias aws-mysql="ssh -i $HOME/Dropbox/Key/aws-mysql-study.pem ubuntu@ec2-54-250-215-41.ap-northeast-1.compute.amazonaws.com"
alias aws-dev-openknowl="ssh -i $HOME/Dropbox/Key/aws-dev-openknowl.pem ubuntu@ec2-54-250-239-90.ap-northeast-1.compute.amazonaws.com"
alias ssh-openknowl-master='ssh master@openknowl.com'
alias ssh-openknowl-dev='ssh anster@dev.openknowl.com'


