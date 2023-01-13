ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# mkdir -p "$(dirname $ZINIT_HOME)"
# git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light paulirish/git-open
zinit light reegnz/jq-zsh-plugin

# ==================== config =======================
typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/) # homebrew path
	$HOME/.nodenv/bin(N-/) # nodenv path
	$HOME/development/flutter/bin(N-/) # flutter path
	$HOME/development/deopt_tools/(N-/) # deopt_tools
  $HOME/.cargo/bin(N-/) # rust
  $HOME/development/android-platform-tools(N-/) # android tools
  $HOME/Library/Android/sdk/emulator(N-/) # android emulator tool
  $HOME/.jenv/bin(N-/)
  $HOME/.pub-cache/bin(N-/)
  $HOME/development/monarch/bin(N-/)
  /Applications/Alacritty.app/Contents/MacOS(N-/)
	/usr/local/bin(N-/)
  $HOME/gobin(N-/)
	$path
)

export GOBIN=$HOME/gobin

# anyenv
eval "$(anyenv init -)"

# nodenv setting
eval "$(nodenv init -)"

# jenv setting
eval "$(jenv init -)"
enable JAVA_HOME
jenv enable-plugin export
export ANDROID_HOME=$HOME/Library/Android/sdk

# no beep
setopt no_beep
setopt nolistbeep

# history settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=10000000
setopt EXTENDED_HISTORY
setopt hist_expand
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt share_history

# Yank to the system clipboard for vi keybind
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy
}
zle -N vi-yank-xclip


# backward-kill-word with directory delimiter
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>|'

# peco setting
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd `echo $selected_dir | awk '{print$2}'`"
    CURSOR=$#BUFFER
    zle reset-prompt
  fi
}
zle -N peco-cdr

# ghq
function peco-ghq () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq

# memo
function memo() {
  MEMO_HOME=$HOME/memo
  MEMO_FILE=$MEMO_HOME/$(date +%Y_%m_%d).md
  if [[ -d $MEMO_HOME ]] then
    mkdir $MEMO_HOME -P
  fi
  if [[ -f $MEMO_FILE ]] then
    touch $MEMO_FILE
  fi
  vim $MEMO_HOME/`date +%Y_%m_%d`.md
}

function mkcd() {
  mkdir "$1"
  cd "$1"
}
# placehold.jp
# @param
# $1 = image height
# $2 = image width
# $3 = output directory. "." is default
# $4 = png | jpg, "png" is default
function getdummy() {
  if [ $# -lt 2 ]; then
    echo "you must specify arguments.\n
    \$1: width\n
    \$2: height\n
    \$3: directory, '.' is default\n
    \$4: extension, 'png' is default\n"
  else
    filename="${1}x${2}.${4:=png}"
    directory=$3
    echo "download $filename to $directory"
    curl -o  "${directory}/${filename}" "https://placehold.jp/${filename}"
  fi
}

function ggl() {
   open "https://google.co.jp/search?q=${*// /+}"
}

function deeplink () {
  xcrun simctl openurl $(xcrun simctl list | grep Booted | grep -i $1 | awk 'NR==1{print $(NF-1)}' | sed -E "s/[()]//g") $2
}

function avd() {
  emulator -avd $(emulator -list-avds | head -n1) &>/dev/null &
}

function githistory() {
  git --no-pager reflog | awk '$3 == "checkout:" && /moving from/ {print $8}' | uniq | head
}

function rddpm() {
  PID=`ps aux | grep -E 'DDPM$' | awk '{print $2}'`;
  kill $PID;
  open -addpm;
}



alias -g nproc="sysctl -n hw.logicalcpu"
alias -g vim=nvim
alias zshrc="vim ~/.zshrc"
alias Alacritty="vim ~/dotconfig/alacritty/alacritty.yml"
alias code=code-insiders
# git alias
alias gis="git status"
alias gic="git commit -m $1"
alias gip="git push -u origin $1"
alias gia="git add"
alias giaa="git add -A"

alias -g 'uniqc'="awk '{ v[$0]++ } END { for ( k in v ) print v[k] "\t" k }'"

# key binds
bindkey -v
bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^B" backward-char
bindkey -M viins "^D" delete-char-or-list
bindkey -M viins "^E" end-of-line
bindkey -M viins "^F" forward-char
bindkey -M vicmd "^F" forward-char
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^?" backward-delete-char

bindkey -M viins "^K" kill-line
bindkey -M viins "^N" down-line-or-history
bindkey -M viins "^P" up-line-or-history
bindkey -M viins "^U" backward-kill-line
bindkey -M viins "^W" backward-kill-word
bindkey -M viins "^Y" yank
bindkey -M vicmd 'y' vi-yank-xclip
bindkey -M viins '^J' self-insert

bindkey -M viins 'ƒ' forward-word
bindkey -M vicmd 'ƒ' forward-word

bindkey -M vicmd "j" down-line
bindkey -M vicmd "k" up-line

## custom function bind
bindkey -M viins '^R' peco-history-selection
bindkey -M vicmd '^R' peco-history-selection
bindkey -M viins '^G' peco-cdr
bindkey -M vicmd '^G' peco-cdr
bindkey -M viins '^]' peco-ghq
bindkey -M vicmd '^]' peco-ghq

bindkey -M viins '∆' jq-complete
bindkey -M vicmd '∆' jq-complete


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/torikatsu/development/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/torikatsu/development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/torikatsu/development/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/torikatsu/development/google-cloud-sdk/completion.zsh.inc'; fi
