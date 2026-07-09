# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# paths

typeset -U path PATH

# pnpm
export PNPM_HOME="/home/lone/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) path+=("$PNPM_HOME") ;;
esac
# pnpm end

path+=("$HOME/.cargo/bin")
path+=("$HOME/opt")
path+=("$HOME/.local/bin")

export ANDROID_HOME=/opt/android-sdk
path+=("$ANDROID_HOME/cmdline-tools/latest/bin")



# Load and initialise completion system
autoload -Uz compinit
compinit



# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^R' history-incremental-search-backward

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) printf '\e[1 q';;      # block
        viins|main) printf '\e[5 q';;      # beam
        # '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[1 q'      # block
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


source ~/.local/share/omarchy/default/bash/aliases

alias nv='neovide'
alias please='sudo'
alias bluetooth='bluetui'
alias wifi='impala'
alias glog='git log --graph --abbrev-commit --decorate --date=relative --all'
alias :q="exit"

gedit() {
  xdg-terminal-exec --dir="$PWD" -- $EDITOR $argv >/dev/null 2>&1 &
  disown
}

mkcd(){
  mkdir -p "$1"
  cd "$1"
}



PROMPT="%B% %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

eval "$(zoxide init zsh)"

# launch tmux
# if [[ -z "$TMUX" ]]; then
#     tmux attach || tmux
# fi


vibes()
{
  p=$XDG_CONFIG_HOME/wayvibes/soundpacks/
  in=`eza "$p" | fzf`
  wayvibes "$p/$in" -v 1 -bg &
}


eval "$(batman --export-env)"


export VISUAL=$EDITOR
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd e edit-command-line


cdf() {
  # DIRECTORY=$(fd -t d -H '^\.git$' $HOME/projects | sed 's/\.git\///' | fzf)
  PROJECTS_DIR=$HOME/Projects
  DIRECTORY="$(tv -s="fd -t d -H '^\.git$' $PROJECTS_DIR | sd '/\.git/' ''")"
  echo "cd $DIRECTORY"
  if [ -z "$DIRECTORY" ]; then
    echo "Please chose a DIRECTORY"
  else
    cd "$DIRECTORY"
    activate
    $EDITOR .
    echo "Happy Coding"
  fi
}


conf() {
  FOLDER=$(tv -s="ls ${XDG_CONFIG_HOME}")
  if [ -z "$FOLDER" ]; then
    echo "please chose something"
  else
    cd "$XDG_CONFIG_HOME/$FOLDER" || return
    $EDITOR .
  fi
}

clip(){
  FILEPATH="/tmp/clipboard"
  wl-paste > "$FILEPATH"
  xdg-open "$FILEPATH" &
}

activate() {
  if [ -n "$VIRTUAL_ENV" ]; then
    deactivate
  fi

  if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
  fi
}

kak() {
    if [ -z "$TMUX" ]; then
        exec tmux new-session kak "$@"
    fi

    # 2. Handle Directories
    if [ $# -eq 1 ] && [ -d "$1" ]; then
        (cd "$1" && command kak -e "e .")
    else
        command kak "$@"
    fi
}

# defaults (omarchy ones do not work for some reason)

export EDITOR=kak
export TERMINAL=foot

