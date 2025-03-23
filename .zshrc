# Performance optimizations
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export MISE_POETRY_VENV_AUTO=1
export MISE_POETRY_AUTO_INSTALL=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh


## User configuration

export EDITOR='vim'
export VISUAL='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

export GPG_TTY="$(tty)"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

stty -ixoff # disable sending start/stop characters
stty -ixon # disable start/stop output control
stty start undef # unmap c-q
stty stop undef # unmap c-s
tabs -2 # use two space tabs

unsetopt beep # never beep
unsetopt correct # don't correct command spelling


## ZSH History Config
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
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


# Search Configuration
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git || git ls-tree -r --name-only HEAD || rg --files --hidden --follow --glob '!.git' || find ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
 --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'

export FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git --exclude .cache'
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
export FZF_CTRL_T_OPTS="
  --ansi
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --preview-window=top:60%
  --info=inline --layout=reverse
  --bind 'ctrl-t:reload(fd -u -E .git -E node_modules -E bin -E obj -E .venv -E .python --color always .)'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
	--bind 'ctrl-f:preview-half-page-down'
	--bind 'ctrl-b:preview-half-page-up'
  --bind='enter:execute(vim {+1})'
  --color header:italic
  --header='enter=print, C-t=recurse, C-/=change-preview, C-b=preview-up, C-f=preview-down'
"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --info=inline --layout=reverse
  --preview 'tree -C {}'
  --preview-window=top:60%
  --color header:italic
  --header='enter=cd'
"

export FZF_CTRL_R_OPTS="
	--bind 'ctrl-f:page-down'
	--bind 'ctrl-b:page-up'
  --bind 'ctrl-l:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header='enter=enter, C-l=copy, C-b=up, C-f=down'
"

export FZF_PREVIEW_ADVANCED=true
export FZF_TMUX_HEIGHT=100%

export _ZO_FZF_OPTS="
  --walker-skip .git,node_modules,target
  --no-sort --keep-right --info=inline --layout=reverse --margin=0,1 --exit-0 --select-1
  --preview 'tree -L 3 -C {2..}' --exact --no-sort
  --preview-window=bottom:80%
  --color header:italic
  --bind 'ctrl-l:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header='enter=cd, C-p=copy'
"

export FORGIT_FZF_DEFAULT_OPTS="
--exact
--cycle
--reverse
--preview-window=bottom:80%
--height '100%'
"
export FORGIT_STASH_FZF_OPTS='
--bind="ctrl-d:reload(git stash drop $(cut -d: -f1 <<<{}) 1>/dev/null && git stash list)"
'

export FORGIT_LOG_FZF_OPTS='
--header="enter=view, C-o=nvim, C-y=yank"
--bind="ctrl-l:execute-silent(echo {} | grep -Eo [a-f0-9]+ | head -1 | tr -d '"'\n'"' | $FORGIT_COPY_CMD)"
--bind="ctrl-o:execute(echo {} | grep -Eo [a-f0-9]+ | head -1 | xargs git show | vim -)"
'

export FORGIT_PAGER='delta -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}'

export BAT_THEME=TwoDark
export BAT_PAGER="less -RS"
export BAT_STYLE=header,numbers,grid


## Default Key Bindings
pb-kill-whole-line () {
  zle kill-whole-line
}
zle -N pb-kill-whole-line
bindkey "^U"      pb-kill-whole-line
bindkey "^A"      beginning-of-line
bindkey "^E"      end-of-line
bindkey "^K"      kill-line

bindkey "^Q"      fzf-file-widget
bindkey "^J"      fzf-cd-widget


## Zsh Plugins
bindkey -M main '^[OA' history-substring-search-up
bindkey -M main '^[OB' history-substring-search-down
bindkey -M main '^[[A' history-substring-search-up
bindkey -M main '^[[B' history-substring-search-up

function zvm_after_init() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_HIGHLIGHT_FOREGROUND=green             # Color name
  ZVM_VI_HIGHLIGHT_FOREGROUND=#008800           # Hex value
  ZVM_VI_HIGHLIGHT_BACKGROUND=red               # Color name
  ZVM_VI_HIGHLIGHT_BACKGROUND=#ff0000           # Hex value
  ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline    # bold and underline
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

  ZVM_KEYTIMEOUT=0.1
  ZVM_VI_HIGHLIGHT_BACKGROUND=gray
  ZVM_VI_HIGHLIGHT_FOREGROUND=gray

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  bindkey "${terminfo[kcbt]}" reverse-menu-complete

  zvm_bindkey viins '^[[A' history-substring-search-up
  zvm_bindkey viins '^[[B' history-substring-search-down
  zvm_bindkey vicmd '^[[A' history-substring-search-up
  zvm_bindkey vicmd '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
  bindkey '^P' history-substring-search-up
  bindkey '^N' history-substring-search-down

  zvm_bindkey vicmd "^A" beginning-of-line
  zvm_bindkey vicmd "^E" end-of-line
  zvm_bindkey vicmd '^K' zvm_forward_kill_line
  zvm_bindkey vicmd '^W' backward-kill-word
  zvm_bindkey vicmd "^U" pb-kill-whole-line

  zvm_bindkey vicmd '^D' delete-char
  zvm_bindkey viins '^D' delete-char

  zvm_bindkey vicmd '^B' backward-char
  zvm_bindkey vicmd '^F' forward-char

  zvm_bindkey viins '^S' redo
  zvm_bindkey viins '^Z' undo
  bindkey '^S' redo
  bindkey '^Z' undo

  bindkey "^[b" backward-word
  bindkey "^[f" forward-word
  bindkey '^h' backward-delete-char
  bindkey '^w' backward-kill-word

  bindkey "^Q"      fzf-file-widget

  bindkey '^[[Z'    autosuggest-accept # Shift + Tab, suggest accept
  bindkey '^[^M'    autosuggest-execute # Option + Enter, suggest execute
  bindkey -s '^ ' ' git status --short^M'
  # bindkey -s '^ ' ' git status --short^M'

  # Check if the keybinding is already set
  # bindkey -M viins
}

zvm_after_init_commands=(autopair-init)
my_zvm_vi_yank() {
    zvm_vi_yank
    echo -en "${CUTBUFFER}" | pbcopy
}
my_zvm_vi_replace_selection() {
    CUTBUFFER=$(pbpaste)
    zvm_vi_replace_selection
    echo -en "${CUTBUFFER}" | pbcopy
}
zvm_after_lazy_keybindings() {
    zvm_define_widget my_zvm_vi_yank
    zvm_define_widget my_zvm_vi_substitute_whole_line

    zvm_bindkey visual 'p' my_zvm_vi_replace_selection
    zvm_bindkey visual 'y' my_zvm_vi_yank
}

export fzfTabFindKeep=1000
bindkey '^ ' 'fzf-tab-complete-find'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# should be loaded before zsh-*
zplug "jeffreytse/zsh-vi-mode"
zplug "Aloxaf/fzf-tab"
zplug "Freed-Wu/fzf-tab-source", use:fzf-tab-source.plugin.zsh

zplug "hlissner/zsh-autopair", use:autopair.zsh
zplug "zsh-users/zsh-completions", defer:0
zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "atusy/gh-fzf"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/mise", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

for script in $(find "$HOME/dotfiles/plugin" -name '*.zsh'); do
    source $script
done

zplug load

## Alias
alias la='eza --all --long --group --group-directories-first --header'
alias lh='eza --all --long --group --group-directories-first --header'
alias ls='eza --long --group --group-directories-first --header'
alias l='eza --long --group --group-directories-first --header'

alias vt='vi ~/.tmux.conf'
alias vz='vi ~/.zshrc'
alias vv='vi ~/.vimrc'
alias vg='vi ~/.gitconfig'

alias du='du -csh'
alias df='df -h'

alias grep='grep --color=auto'

alias g="git"
alias gh=ghf

alias cat="bat"
alias vi="vim"

alias v="rgi"

alias m="mise"

alias f='open -a Finder ./'

alias a="zi"

alias god="cd $HOME/dotfiles"
alias gog="cd $HOME/github"
alias gow="cd $HOME/workspace"

alias k="kubectl"
alias kk="k9s"
alias kx="kubectx"
alias kn="kubens"

alias python="python3"
alias pip="pip3"

alias p="python"
alias pe="pyenv"
alias pv="pyenv virtualenv"
alias pd="pyenv deactivate"
alias pa="pyenv activate"

alias tm="tmux"
alias tma='tmux a -t'
alias tmn="tmux new"
alias tmk='tmux kill-session -t'
alias tmh="tmux list-keys | percol"

alias tp='trash-put'
alias tl='trash-list'

alias -s {md,markdown,rst,toml,json,yaml}=code

# q - query against files
q() {
  local result parsed file position
  local margin=15

	result=$(rg --hidden --follow --glob '!.git' --line-number --with-filename . --field-match-separator $'\u00a0' | \
	  fzf --sync \
	  --walker-skip .git,node_modules,target \
	  --delimiter $'\u00a0' \
    --header='enter=edit, C-l=copy, C-b=preview-up, C-f=preview-down' \
	  --color header:italic \
    --bind 'ctrl-l:execute-silent(echo -n {+1} | pbcopy)+abort' \
	  --bind 'ctrl-f:preview-half-page-down' \
	  --bind 'ctrl-b:preview-half-page-up' \
	  --bind 'enter:become(echo {+1} {+2})' \
	  --preview "bat --color=always {1} --highlight-line {2} --style=header,numbers --file-name {1}" \
    --preview-window=top:60%
	)

	parsed=$(echo $result | rs -g1 -t 0 2)
  file=$(echo $parsed | cut -d ' ' -f 1)
  line=$(echo $parsed | cut -d ' ' -f 2)

  [ -n "$file" ] && vim "$file" +$line
}

# j - jump to directories
j() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(
    FZF_DEFAULT_COMMAND=${FZF_ALT_C_COMMAND:-} \
    FZF_DEFAULT_OPTS=$(__fzf_defaults "--reverse --walker=dir,follow,hidden --scheme=path" "${FZF_ALT_C_OPTS-} +m") \
    FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd) < /dev/tty)"
  if [[ -z "$dir" ]]; then
    return 0
  fi
  builtin cd -- ${(q)dir:a}

  zle jump-fzf
}

# c - browse chrome history
c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Profile 1/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  # shellcheck disable=2086
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf $fzf_default_options $fzf_height --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}


## Completions
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' show-group full
zstyle ':fzf-tab:*' single-group full
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' continuous-trigger 'tab'
# zstyle ':fzf-tab:*' accept-line enter


## Load libraries
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

export PATH="$HOME/.pyenv:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null ; then
  eval "$(pyenv virtualenv-init -)"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi


if command -v direnv >/dev/null ; then
  eval "$(direnv hook zsh)"
fi

