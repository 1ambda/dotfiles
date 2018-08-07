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

# User configuration
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:$PATH"

HISTSIZE=100000000
SAVEHIST=100000000

source $ZSH/oh-my-zsh.sh

## Custom Configuration
alias vi="/usr/local/bin/vi"
alias vim="/usr/local/bin/vim"
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
alias g="git"

#### zsh-snippets
alias spl="_list_zsh_snippets"
alias spa="_add_zsh_snippets"
alias spc="_clean_zsh_snippets"

alias me='whoami'
alias today='date'
alias dir='nautilus .'

#### TRASH
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
alias jpk="jps | peco | awk '{ print $1 }' | xargs kill -15"
alias zp="z | peco"
alias zc="history | peco"
alias untar='tar -zxvf'
alias untarxz='tar -xJf'

# tmux
alias tmx="tmuxinator"
alias tm="tmux"
alias tma='tmux a -t'
alias tmn="tmux new"
alias tmk='tmux kill-session -t'
alias tmh="tmux list-keys | percol"

alias b=~/github/dotfiles/OSX/fzf/b.rb

alias tree="tree -C"
alias gh="hub"
alias gf="git-flow"

alias vup="osascript -e 'set volume output volume ((output volume of (get volume settings)) + 10)'"
alias vdown="osascript -e 'set volume output volume ((output volume of (get volume settings)) - 10)'"
alias vmute="osascript -e 'set Volume 0'"

alias dk="docker"
alias dkm="docker-machine"
alias dkc="docker-compose"
alias dks=" docker stop $(docker ps -a -q); docker rm -f $(docker ps -a -q); docker volume rm $(docker volume ls -f dangling=true -q);"

alias ec="emacsclient -c &"
alias ed="emacs --daemon"
alias ek="emacsclient -e \"(kill-emacs)\""

function setjdk() {
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
setjdk 1.8


if which peco &> /dev/null; then
  function peco_select_history() {
    BUFFER=$(fc -l -n -r 1 | \
                peco --layout=bottom-up --query "$LBUFFER")
    CURSOR=$#BUFFER # move cursor
    zle -R -c       # refresh
  }
 
  zle -N peco_select_history
  bindkey '^R' peco_select_history
fi

# zplug
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

zplug "chrissicool/zsh-256color"

zplug "plugins/brew-cask", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/terraform", from:oh-my-zsh
#zplug "plugins/common-aliases", from:oh-my-zsh #hang
#zplug "plugins/fasd", from:oh-my-zsh #hang
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
# zplug "plugins/tmux", from:oh-my-zsh
# zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "plugins/terraform", from:oh-my-zsh
# zplug "mgryszko/jvm"
zplug "peterhurford/git-it-on.zsh"
alias gi="gitit"
alias gop="gitit pulls $@"
alias gor="gitit repo $2 $3"
alias gof="gitit ctrlp $@"
zplug "hlissner/zsh-autopair", use:autopair.zsh
zplug "1ambda/zsh-snippets", use:snippets.plugin.zsh
# zplug "$HOME/github/1ambda/zsh-snippets", from:local, use:'snippets.plugin.zsh'
alias zsp=zsh_snippets
bindkey '^S^S' zsh-snippets-widget-expand
bindkey '^S^A' zsh-snippets-widget-list

zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

zplug "modules/tmux",       from:prezto
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
zplug "modules/ssh",        from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto
zplug "docker/compose", use:contrib/completion/zsh/

zstyle ':prezto:module:utility:ls'    color 'yes'
zstyle ':prezto:module:utility:diff'  color 'yes'
zstyle ':prezto:module:utility:wdiff' color 'yes'
zstyle ':prezto:module:utility:make'  color 'yes'

zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''


# zplug "marzocchi/zsh-notify"
# zplug "plugins/vi-mode", from:oh-my-zsh
# zplug "hchbaw/zce.zsh", use:zce.zsh

zplug load

# fasd
eval "$(fasd --init auto)"

# fzf related aliases

export FZF_DEFAULT_OPTS="
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias agf="ag --nobreak --nonumbers --noheading . | fzf"

# unalias v
v() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
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

j() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
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

# git add with FZF

ga() {
  local result
  result=$(git ls-files -m --others --exclude-standard | fzf -m)
  if [ "x$result" != "x" ]
  then
    git add $result
  fi
}

# gco - checkout git branch/tag
# unalias gco
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

alias l="k -ah"

alias google='_web_search google'
alias github='_web_search github'
alias naver='_web_search naver'
alias stackoverflow='_web_search stackoverflow'

alias tf='terraform'

# python env
export PATH="/Users/username/.pyenv:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)" # pyenv-virtualenv

# autoenv
source $(brew --prefix autoenv)/activate.sh

# conda
# export PATH="$HOME/miniconda2/bin:$PATH"

export GVM_DIR="$HOME/.gvm"
[[ -s "$GVM_DIR/scripts/gvm" ]] && source "$GVM_DIR/scripts/gvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias k=kubectl
alias kx=kubectx
alias ke=kubens

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
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
}
_gen_fzf_default_opts

### ZSH History config ###

setopt append_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history

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

RPROMPT=''$'\u2638 '' ''$(kubectl config current-context | sed -e "s/.io//" -e "s/.k8s.local//" -e "s/kops.//" -e "s/enterprise.zepl/enterprise/")'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/1ambda/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/1ambda/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/1ambda/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/1ambda/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
