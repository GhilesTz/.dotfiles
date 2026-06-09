# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

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
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[1 q';;      # block
        # viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[1 q"
}
zle -N zle-line-init
echo -ne '\e[1 q'      # block
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[1 q' ;} # Use beam shape cursor for each new prompt.


source ~/.local/share/omarchy/default/bash/aliases

alias nv='neovide'
alias please='sudo'
alias vid='mpv --target-colorspace-hint-mode=source'
alias bluetooth='bluetui'
alias wifi='impala'
alias glog='git log --graph --abbrev-commit --decorate --date=relative --all'
alias ai="opencode --model groq/moonshotai/kimi-k2-instruct-0905 --agent plan --no-thinking run"
alias ai-do="opencode --model groq/moonshotai/kimi-k2-instruct-0905 --no-thinking run"

gnv() {
  xdg-terminal-exec --dir="$PWD" -- nvim $argv >/dev/null 2>&1 &
  disown
}

mkcd(){
  mkdir -p $1
  cd $1
}



PROMPT="%B% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "
eval "$(zoxide init zsh)"






# pnpm
export PNPM_HOME="/home/lone/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end




# launch tmux
# if [[ -z "$TMUX" ]]; then
#     tmux attach || tmux
# fi


vibes()
{
  p=$XDG_CONFIG_HOME/wayvibes/soundpacks/
  in=`eza $p | fzf`
  wayvibes $p/$in -v 1 -bg &
}






PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/opt/"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:/opt/android-sdk/cmdline-tools/latest/bin"




eval "$(batman --export-env)"
export BROWSER=/usr/bin/brave


export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd e edit-command-line


cdf() {
  # DIRECTORY=$(fd -t d -H '^\.git$' $HOME/projects | sed 's/\.git\///' | fzf)
  DIRECTORY=$(tv -s="fd -t d -H '^\.git$' $HOME/projects | sd '/\.git/' ''")
  echo "cd $DIRECTORY"
  if [ -z $DIRECTORY ]; then
    echo "Please chose a DIRECTORY"
  else
    cd $DIRECTORY
    activate
    $EDITOR .
    echo "Happy Coding"
  fi
}


conf() {
  FOLDER=$(tv -s="ls ${XDG_CONFIG_HOME}")
  if [ -z $FOLDER ]; then
    echo "please chose something"
  else
    cd "$XDG_CONFIG_HOME/$FOLDER"
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

export ANDROID_HOME=/opt/android-sdk

autoload bashcompinit
bashcompinit
source "/home/lone/.local/share/bash-completion/completions/am"

# Allow Ctrl-z to toggle between suspend and resume
function Resume {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N Resume
bindkey "^Z" Resume
