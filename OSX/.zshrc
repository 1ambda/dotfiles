# Path to your oh-my-zsh installation.
export ZSH=/Users/1002471/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# PS1
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(pod osx brew web-search git-flow git git-extras zsh-syntax-highlighting command-not-found common-aliases fasd tmux npm nvm bower grunt gulp pyenv sbt scala heroku tmuxinator history-peco)

# User configuration

## Custom Configuration
### alias sugar
alias vh='sudo vim /etc/hosts'
alias vt='vi ~/.tmux.conf'
alias vz='vi ~/.zshrc'
alias vze='vi ~/.zshenv'
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

#### Path
alias cpwd='pwd | tr -d "\n" | pbcopy'

#### fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias gnp="git --no-pager"

alias me='whoami'
alias today='date'

alias dir='nautilus .'

#### TMUX
alias tm="tmux"
alias tma='tmux a -t'
alias tmn="tmux new"
alias tmk='tmux kill-session -t'

#### TRASH
alias rm='echo "Use trash-cli to remove files instead of rm." false'
alias rmdir='echo "Use trash-cli to remove files instead of rmdir." false'
alias tp='trash-put'
alias tl='trash-list'

alias pp="pwd | pbcopy"

alias zsh-count="cut -f2 -d';' $HOME/.zsh_history | sort | uniq -c | sort -nr | head -n 30"

alias hs="history | grep -i $1"

alias svi='sudo vi'
alias smv='sudo mv'
alias service='sudo service'

alias disk-usage='du -h | sort -h | tail -n 1000'
alias xc="xclip -selection clipboard"
alias fpp='sudo lsof -iTCP -sTCP:LISTEN -n -P'
alias psef="ps -ef | grep"
alias psp="ps -ef | peco"
alias pspk="ps -ef | peco | awk '{ print $2 }' | xargs kill"
alias zp="z | peco"
alias zc="history | peco"

alias untar='tar -zxvf'
alias untarxz='tar -xJf'

### tree

alias tree="tree -C"

### git, gitflow
alias gf="git flow"

function __head_number {
    if [ $# -le 1 ]; then
        echo "usage: hn 5 command"
    else
        count=$1
        shift
        $@ | head -n $count
    fi
}
alias hn=__head_number

function __tail_number {
    if [ $# -le 1 ]; then
        echo "usage: tn 5 command"
    else
        count=$1
        shift
        $@ | tail -n $count
    fi
}
alias tn=__tail_number

function __git_peco {
    if [ $# -eq 1 ]; then
        git $1 | peco
    else
        echo "usage: gpc arg1"
    fi
}
alias gpc="__git_peco"

function __git_log_peco {
    if [ $# -eq 1 ]; then
        # add wipe, wip, filter WIP message from WIP
        git log --oneline --graph | peco | head -n1 | grep -o '[a-z0-9]\+' | head -n1 | awk '{ print $1 }' | xargs -I % sh -c "git $1 %;"
    else
        echo "usage: glpc arg1"
    fi
}
alias glpc=__git_log_peco

function __gapi {
    if [ $# -eq 0  ]; then
        echo "no parameters"
    elif [ $# -eq 1 ]; then
        curl -u 1ambda "https://api.github.com$1"
    fi
}
alias gapi="__gapi"


### hadoop
alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/stop-dfs.sh"

### thgfuck
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'

# export MANPATH="/usr/local/man:$MANPATH"

export TERM=screen-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:$PATH"

HISTSIZE=100000000
SAVEHIST=100000000

source $ZSH/oh-my-zsh.sh

# ssh
source ~/.ssh/alias.sh
source ~/.ssh/ghost.sh

# tmux
export EDITOR='vim'
alias tmx="tmuxinator"

# volumn up, down
alias vup="osascript -e 'set volume output volume ((output volume of (get volume settings)) + 10)'"
alias vdown="osascript -e 'set volume output volume ((output volume of (get volume settings)) - 10)'"
alias vmute="osascript -e 'set Volume 0'"

# You may need to manually set your language environment

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/1002471/.gvm/bin/gvm-init.sh" ]] && source "/Users/1002471/.gvm/bin/gvm-init.sh"

funciton n setjdk() {
  if [ $# -ne 0 ]; then
  removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
  if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
  fi
  export JAVA_HOME=`/usr/libexec/java_home -v $@`
  export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# added by travis gem
[ -f /Users/1002471/.travis/travis.sh ] && source /Users/1002471/.travis/travis.sh
