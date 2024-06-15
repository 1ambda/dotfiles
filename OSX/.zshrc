eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
COMPLETION_WAITING_DOTS="true"

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

# plugins
plugins=(
  fzf-tab F-Sy-H zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search fast-syntax-highlighting
  docker docker-compose
  ssh-agent gpg-agent gh
  brew
  golang gradle mvn npm nvm pip poetry pyenv virtualenv python sbt scala
  asdf ag
  direnv autoenv
  terraform
  helm
)


# User configuration
export EDITOR='vim'
export VISUAL='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PATH="/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

# Search Configs (fzf/rg)
export IGNORED_DIRS="{.git,.bzr,.svn,.hg,CVS,node_modules,dist,deps,_build,.backstop,.elixir_ls,.cache}"
export RG_DEFAULT_FLAGS=(--hidden --follow --max-columns 150)
export RG_DEFAULT_ARGS=($RG_DEFAULT_FLAGS --glob "!**/$IGNORED_DIRS/*")
export FZF_DEFAULT_COMMAND="rg --files $RG_DEFAULT_FLAGS --glob '!**/$IGNORED_DIRS/*'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-c:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-C to copy command into clipboard'"
export FZF_ALT_C_OPTS="${FZF_ALT_C_OPTS:+$FZF_ALT_C_OPTS} 
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-c:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-C to copy command into clipboard'"

## Custom Configuration
# alias vi="/usr/local/bin/vi"
# alias vim="/usr/local/bin/vim"
alias vh='sudo vi /etc/hosts'
alias vt='vi ~/.tmux.conf'
alias vz='vi ~/.zshrc'
alias vze='vi ~/.zshenv'
alias vv='vi ~/.vimrc'
alias vg='vi ~/.gitconfig'
alias vs='vi ~/.ssh/config'
alias va='vi ~/.aws/credentials'

alias gog='cd ~/github'
alias cdp='git rev-parse && cd "$(git rev-parse --show-cdup)"'
alias g="git"
alias commit="git cz"
alias commit-init="commitizen init cz-conventional-changelog --save-dev --save-exact"

alias agf="ag --nobreak --nonumbers --noheading . | fzf"

#### zsh-snippets
alias me='whoami'
alias today='date'
alias dir='nautilus .'

#### System
alias tp='trash-put'
alias tl='trash-list'
alias pp="pwd | pbcopy"
alias hs="history | grep -i $1"
alias disk-usage='du -h | sort -h | tail -n 1000'
alias xc="xclip -selection clipboard"
alias fpp='sudo lsof -iTCP -sTCP:LISTEN -n -P'
alias psef="ps -ef | grep"
alias psp="ps -ef | peco"
alias pspk="ps -ef | peco | awk '{ print $2 }' | xargs kill"
alias nsp="lsof -iTCP -sTCP:LISTEN -n -P | peco"
alias nspk="lsof -iTCP -sTCP:LISTEN -n -P | peco | awk '{ print $2 }' | xargs kill"


alias jpk="jps | peco | awk '{ print $0 }' | xargs kill -15"
alias zp="z | peco"
alias zc="history | peco"
alias untar='tar -zxvf'
alias untarxz='tar -xJf'

#### exa
alias ls='exa --long --header --git'
alias llt='exa -lbF --git --tree --level=2'

### terminal
alias b=bat

#### kubernetes and infra
alias tf='terraform'
export PATH="$HOME/.krew/bin:$PATH"
alias helm=helm3
alias krew=kubectl-krew
alias k=kubectl
alias kx=kubectx
alias kn=kubens
alias k9=k9s

ka() {
  local cmd=${1:-/bin/bash}
  local pod 
  local namespace 
  echo -e ""
  pod=$(kubectl get pods --all-namespaces | tail -n +2 | awk '{print $2}' | fzf -m)

  if [ "x$pod" != "x" ]
  then
    namespace=$(kubectl get pods --all-namespaces | grep ${pod} | awk '{print $1}')
    echo -e ""
    echo "kubectl -n ${namespace} exec -it ${pod} -- ${cmd};"
    echo -e ""
    kubectl -n ${namespace} exec -it ${pod} -- ${cmd};
  fi
}

#### make
alias m=mmake

#### tmux
alias tmx="tmuxinator"
alias tm="tmux"
alias tma='tmux a -t'
alias tmn="tmux new"
alias tmk='tmux kill-session -t'
alias tmh="tmux list-keys | percol"

alias b=~/github/dotfiles/OSX/fzf/b.rb

alias tree="tree -C"
alias gf="git-flow"

alias vup="osascript -e 'set volume output volume ((output volume of (get volume settings)) + 10)'"
alias vdown="osascript -e 'set volume output volume ((output volume of (get volume settings)) - 10)'"
alias vmute="osascript -e 'set Volume 0'"

# zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

ENHANCD_FILTER=fzf:peco

zplug "chrissicool/zsh-256color"
zplug "hlissner/zsh-autopair", use:autopair.zsh
# zplug "zsh-users/zsh-completions", defer:0
# zplug "junegunn/fzf-git.sh", use:fzf-git.sh
KEYTIMEOUT=2 # 10ms for key sequences for vi

# zplug "plugins/brew-cask", from:oh-my-zsh
# zplug "plugins/osx", from:oh-my-zsh
# zplug "plugins/terraform", from:oh-my-zsh
# zplug "plugins/command-not-found", from:oh-my-zsh
# zplug "b4b4r07/enhancd", use:init.sh
# zplug "plugins/terraform", from:oh-my-zsh
# zplug "plugins/virtualenv", from:oh-my-zsh

# zplug "b4b4r07/zsh-vimode-visual", defer:3
# zplug "zsh-users/zsh-autosuggestions", defer:1, on:"zsh-users/zsh-completions"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2, on:"zsh-users/zsh-autosuggestions"

# zplug 'b4b4r07/httpstat', as:command, use:'(*).sh', rename-to:'$1'
# zplug "modules/tmux",       from:prezto
# zplug "modules/history",    from:prezto
# zplug "modules/utility",    from:prezto
# zplug "modules/ssh",        from:prezto
# zplug "modules/terminal",   from:prezto
# zplug "modules/directory",  from:prezto
# zplug "modules/completion", from:prezto
# zplug "docker/compose", use:contrib/completion/zsh/

# zstyle ':prezto:module:utility:ls'    color 'yes'
# zstyle ':prezto:module:utility:diff'  color 'yes'
# zstyle ':prezto:module:utility:wdiff' color 'yes'
# zstyle ':prezto:module:utility:make'  color 'yes'
# 
# zstyle ':completion:*' rehash true
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*' group-name ''

# zplug "marzocchi/zsh-notify"
# zplug "hchbaw/zce.zsh", use:zce.zsh

zplug load

# fasd
if command -v fasd >/dev/null ; then
  eval "$(fasd --init auto)"
fi

# fzf
export FZF_DEFAULT_OPTS="
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# unalias v
# v() {
#   local file
#   file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
# }
v() {
  if (( # == 0 )); then
    vim 
  elif (( # == 1 )); then
    vim $1 
  elif (( # == 2 )); then
	  vim +"$2|norm! zt" $1
  else
    vim "$@"
  fi
}


# unalias q
q() {
  local result lines file position 

	result=$(rg --line-number --with-filename . --field-match-separator $'\u00a0' | fzf -m --sync --bind 'pgdn:preview-half-page-down,pgup:preview-half-page-up,ctrl-f:preview-down,ctrl-b:preview-up,enter:become(echo {+1} {+2})' --delimiter $'\u00a0' --preview "bat --color=always {1} --highlight-line {2} --style=header,numbers") 
	lines=$(echo $result | tr ' ' $'\n' | rs -g1 -t 0 2)

	if [ -n "$result" ]; then

    local IFS=$'\n'
    if [ $ZSH_VERSION ]; then
      setopt sh_word_split
    fi
    
    for line in ${lines}; do 
      file=$(echo $line | cut -d ' ' -f 1)
      position=$(echo $line | cut -d ' ' -f 2)
      echo "$file $position (LINE)"
    done
    echo ""
	fi
}

# unalias p
p() {
  local out file dirpath
  out=$(rg --line-number --with-filename . --field-match-separator $'\u00a0' | fzf -m --bind 'pgdn:preview-half-page-down,pgup:preview-half-page-up,ctrl-f:preview-down,ctrl-b:preview-up' --delimiter $'\u00a0' --preview "bat --color=always {1} --highlight-line {2} --style=header,numbers")
  file=$(cut -d $'\u00a0' -f 1 <<< $out)
  if [ -n "$file" ]; then
    dirpath=$(dirname $file)
    cd $dirpath
  fi
}

j() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# unalias o
o() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}


# unalias y
y() {
  local file
  file=$(git status --porcelain | sed s/^...// | fzf -1 -0 --no-sort +m)
  if [ -n "$file" ]; then
    echo "$file"
    echo "$file" | pbcopy
  fi
}

unalias z
z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# fh - repeat history
# unalias h
h() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 0 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fk() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# ga - git add {MODIFIED FILES}
ga() {
  local result
  result=$(git ls-files -m --others --exclude-standard | fzf -m)
  if [ "x$result" != "x" ]
  then
    echo $result | xargs -I % sh -c 'git add %'
  fi
}

# gr - git reset HEAD {ADD FILES} 
gr() { 
  local result
  result=$(git --no-pager diff --cached --name-only | fzf -m)
  if [ "x$result" != "x" ]
  then
    echo $result | xargs -I % sh -c 'git reset HEAD %'
  fi
}

# gco - checkout git branch/tag
# unalias gco

alias gm="git com; git pull origin master"

gco() { 
  local tags branches target; 
  tags=$(git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return; branches=$(git branch --all | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return; target=$( (echo "$tags"; echo "$branches") | fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return; git checkout $(echo "$target" | awk '{print $2}') 
}

# gl - git commit browser
# unalias gl
gl() {
  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" | fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort --bind "ctrl-m:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {} FZF-EOF"
}

# gs - get git commit sha
# example usage: git rebase -i `gs`
gs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
gt() {
  local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b);
    do
      q=$(head -1 <<< "$out")
      k=$(head -2 <<< "$out" | tail -1)
      sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
      [ -z "$sha" ] && continue
      if [ "$k" = 'ctrl-d' ]; then
        git diff $sha
      elif [ "$k" = 'ctrl-b' ]; then
        git stash branch "stash-$sha" $sha
        break;
      else
        git stash show -p $sha
      fi
    done
}
# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# https://gist.github.com/muralisc/d1ed7226533ab23e4e1e
fp() {
	panes=$(tmux list-panes -s -F '#I:#P #W #{pane_current_path} #{pane_current_command} #{pane_title}')
	current_window=$(tmux display-message  -p '#I')

	target=$(echo "$panes" | fzf) || return

	target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
	target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

	if [[ $current_window -eq $target_window ]]; then
		tmux select-pane -t ${target_window}.${target_pane}
	else
		tmux select-pane -t ${target_window}.${target_pane} &&
			tmux select-window -t $target_window
	fi
}

# c - browse chrome history
c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# web_search from terminal: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/web-search/web-search.plugin.zsh
function _web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google      	"https://www.google.com/search?q="
    github      	"https://github.com/search?q="
    naver			"https://search.naver.com/search.naver?query="
    stackoverlfow	"http://stackoverflow.com/search?q="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}


# direnv
if command -v direnv >/dev/null ; then
  eval "$(direnv hook zsh)"
fi

# python env
alias python=python3
export PATH="$HOME/.pyenv:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

function virtualenv_prompt_info() {
  [[ -n ${VIRTUAL_ENV} ]] || return
  local NAME="${VIRTUAL_ENV:t}"
  if [[ $NAME == "venv" || $NAME == "env" || $NAME == ".venv" ]]; then
    local BASE="${VIRTUAL_ENV:h}"
    NAME="${BASE:t}"
  fi
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=(}${NAME}${ZSH_THEME_VIRTUALENV_SUFFIX:=)}"
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

# autoenv
source $(brew --prefix autoenv)/activate.sh

# fzf color theme
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
}
_gen_fzf_default_opts


# Language Framework

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"
alias jvm="jabba"

export GVM_DIR="$HOME/.gvm"
[[ -s "$GVM_DIR/scripts/gvm" ]] && source "$GVM_DIR/scripts/gvm"

export GPG_TTY=$(tty)

export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME.local/bin:$PATH"

if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

source <(kubectl completion zsh)
eval "$(scalaenv init -)"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Fzf Tab Configs
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' continuous-trigger 'tab'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

# FZF Key Bindings
source $(brew --prefix fzf)/shell/key-bindings.zsh 
source $(brew --prefix fzf)/shell/completion.zsh
bindkey '^Q' fzf-file-widget
# bindkey '^I' fzf-cd-widget

# ZSH Key Bindings
# https://apple.stackexchange.com/questions/439702/optionleft-and-optionright-skip-special-characters
autoload -U select-word-style
select-word-style bash

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^K" kill-line
# bindkey "^Y" accept-and-hold
pb-yank () {
  CUTBUFFER=$(pbpaste)
  zle yank
}
zle -N pb-yank
bindkey '^y'   pb-yank

copy-to-xclip() {
    zle kill-buffer
    print -rn -- $CUTBUFFER | pbcopy
};
zle -N copy-to-xclip
bindkey '^]'   copy-to-xclip

pb-kill-whole-line () {
  zle kill-whole-line
  echo -n $CUTBUFFER | pbcopy
}
zle -N pb-kill-whole-line
bindkey '^U'   pb-kill-whole-line

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# ZSH History Config

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=10000000

setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
