# for profile
if [ "$ZSHRC_PROFILE" != "" ]; then
  zmodload zsh/zprof && zprof > /dev/null
fi


#s bind key type
bindkey -v # zinit
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
zinit light hlissner/zsh-autopair

# $HOME/development/flutter/bin(N-/) # flutter path
# $HOME/.pub-cache/bin(N-/) # pub-cache for fvm
# $HOME/.pub-cache/bin(N-/)
# ==================== config =======================
typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/) # homebrew path
	$HOME/.nodenv/bin(N-/) # nodenv path
	$HOME/development/deopt_tools/(N-/) # deopt_tools
  $HOME/.cargo/bin(N-/) # rust
  $HOME/development/android-platform-tools(N-/) # android tools
  $HOME/Library/Android/sdk/emulator(N-/) # android emulator tool
  $HOME/development/monarch/bin(N-/)
  /Applications/Alacritty.app/Contents/MacOS(N-/)
	/usr/local/bin(N-/)
  $HOME/gobin(N-/)
  $HOME/.cargo/env(N-/)
	$path
)



export GOBIN=$HOME/gobin

# anyenv
eval "$(anyenv init -)"

# nodenv setting
eval "$(nodenv init -)"


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


# completation with ignroe case
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# backward-kill-word with directory delimiter
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>|"'

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

# tmux
function peco-tmux () {
  local selected_session=$(tmux ls -F '#S' | peco --query "$LBUFFER")
  if [ -n "$selected_session" ]; then
    BUFFER="tmux a -t${selected_session}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-tmux

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
# git alias
alias gis="git status"
alias gic="git commit -m $1"
alias gip="git push -u origin $1"
alias gia="git add"
alias giaa="git add -A"
alias gch='git branch  | peco | xargs git checkout'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias -g 'uniqc'="awk '{ v[$0]++ } END { for ( k in v ) print v[k] "\t" k }'"

# key binds
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

# bindkey -M vicmd '^A' peco-tmux
# bindkey -M viins '^A' peco-tmux

bindkey -M viins '∆' jq-complete
bindkey -M vicmd '∆' jq-complete

# switch arch
if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	alias x64='exec arch -x86_64 /bin/zsh'
	alias a64='exec arch -arm64e /bin/zsh'
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
		fi
		exec arch -arch $arch /bin/zsh
	}
fi

# function application-selection() {
#     BUFFER=`find /System/Applications -name "*.app" | sed 's!^.*/!!' | tail -r  | awk '!a[$0]++' | peco`
#     CURSOR=$#BUFFER
#     zle reset-prompt
# }
# zle -N application-selection
# bindkey -M viins '^E' application-selection


function zsh-startuptime-slower-than-default() {
  local time_rc
  time_rc=$((TIMEFMT="%mE"; time zsh -i -c exit) &> /dev/stdout)
  # time_norc=$((TIMEFMT="%mE"; time zsh -df -i -c exit) &> /dev/stdout)
  # compinit is slow
  local time_norc
  time_norc=$((TIMEFMT="%mE"; time zsh -df -i -c "autoload -Uz compinit && compinit -C; exit") &> /dev/stdout)
  echo "my zshrc: ${time_rc}\ndefault zsh: ${time_norc}\n"

  local result
  result=$(scale=3 echo "${time_rc%ms} / ${time_norc%ms}" | bc)
  echo "${result}x slower your zsh than the default."
}

function zsh-profiler() {
  ZSHRC_PROFILE=1 zsh -i -c zprof
}


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

