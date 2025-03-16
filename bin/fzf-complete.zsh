local _fd_base_str='fd --follow --hidden --follow --exclude .git --type='
function _fd_base() {
  eval $_fd_base_str$1 --max-depth=3 ${@:2}
}

export FZF_DEFAULT_COMMAND="${_fd_base_str}f"
export FZF_ALT_C_COMMAND="${_fd_base_str}d"

function _fd_filter() {
  # Special-case some of the usages
  case "$2" in
    '~'*)
      # Expand and then collapse `~` at the beginning of the search string and then re-check it
      _fd_filter $1 "${2/#\~/$HOME}"
      ;;
    (../)##(..)#)
      # Parent dir only, handle manually as `dirname` fails to handle that correctly
      _fd_base $1 -p . $2
      ;;
    *)
      # All the rest
      _fd_base $1 -p . "$(dirname "$2")"
      ;;
  esac
}

function _fd_select() {
  local -a opts
  case "$1" in
    'f')
      opts=(--preview="bat --pager=never --color=always --line-range :30 {}" --preview-window=right:70%)
      ;;
    'd')
      opts=(--preview='eza -1 --color=always {}' --preview-window=right:50%)
      ;;
  esac
  _fd_filter $1 "$2" | fzf \
    --ansi $opts \
    --select-1 \
    --exit-0 \
    --layout=reverse --height=75% \
    --tiebreak=begin --bind=tab:down,btab:up,change:top \
    --cycle --query="$(basename "$2")"
}

function _fd_execute() {
  # All through compadd
  #local result=("${(@f)$(_fd_filter $1 $2)}")
  #compadd -a -f result

  # Display FZF manually with a hack to prevent multiple appearances of FZF (i.e. multiple calls to
  # _files and _cd) when cancelling the matching
  if [[ $_matcher_num == 1 ]]; then
    local result=$(_fd_select $1 $2)
    if [[ "$result" != '' ]]; then
      compadd -f -U -- "$result"
    fi
    return 0
  else
    return 1
  fi
}

# Save the original functions since we want them to run when executing `-command-` completion
autoload +X _files _cd
functions[_save_orig_files]=$functions[_files]
functions[_save_orig_cd]=$functions[_cd]

function _files() {
  if [[ $curcontext == ':complete:-command-:' ]]; then
    _save_orig_files $@
  else
    local tokens=(${(z)LBUFFER})
    [ "${LBUFFER[-1]}" = ' ' ] && tokens+=("")
    local query="${tokens[-1]}"
    _fd_execute f "$query"
  fi
}
# function _fzf_compgen_path() { _fs_base f . "$1" }

function _cd() {
  if [[ $curcontext == ':complete:-command-:' ]]; then
    _save_orig_cd $@
  else
    local tokens=(${(z)LBUFFER})
    [ "${LBUFFER[-1]}" = ' ' ] && tokens+=("")
    local query="${tokens[-1]}"
    _fd_execute d "$query"
  fi
}
function _fzf_compgen_dir() { _fd_base d . "$1" }

bindkey '\t' expand-or-complete # fzf-tab reads it during initialization

zstyle ':fzf-tab:*' show-group full
zstyle ':fzf-tab:*' single-group full
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' continuous-trigger 'alt-enter'

# Previews for some commands
local extract="
in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
"
local sanitized_in='${~ctxt[hpre]}"${${in//\\ / }/#\~/$HOME}"'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'eza -1 --color=always '$sanitized_in --preview-window=right:40%
zstyle ':fzf-tab:complete:eza:*' extra-opts --preview=$extract'eza -1 --color=always '$sanitized_in --preview-window=right:40%
zstyle ':fzf-tab:complete:vim:*' extra-opts --preview=$extract'bat --pager=never --color=always --line-range :30 '$sanitized_in --preview-window=right:70%
