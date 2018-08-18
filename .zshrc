# Created by newuser for 5.5.1
export GPG_TTY=$(tty)

# Function will set and reset RPROMPT with a command symbol, along with job and exit error status.
function zle-line-init zle-keymap-select {
  COMMAND_PROMPT="%S%F{yellow}[COMMAND]%f%s"
  RPROMPT="${${KEYMAP/vicmd/$COMMAND_PROMPT}/(main|viins)/}%B%F{cyan}%(1j,[%j],)%b%f%B%F{white}%K{red}%(0?,,[%?])%f%k%b"
  zle reset-prompt
}

# Sets the function as specified above.
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

autoload run-help

# Directory options
setopt autocd            # If not command, try to cd.
setopt auto_pushd        # Push old directory onto the directory stack.
setopt pushd_ignore_dups # Ignore multiple copies on the stack.

# History options
setopt append_history    # Session will append to history file.
setopt share_history     # Session imports from history file.
setopt extended_history  # Saves history with UNIX epoch timestamp and duration.
setopt histignorealldups # Ignore immidate duplicated entries.
setopt inc_append_history # Add commands to history immediately. 

# Globing and expansion
setopt hash_list_all # Hash the entire command path first.
setopt extended_glob # Chracters #, ~ and ^ are treated as oart if the pattern.
setopt noshwordsplit
setopt longlistjobs
setopt notify # Immediately report bg job status.
setopt nohup # Do not send hup signal to any running jobs.

zstyle ':completion:*' menu select
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Prompt

prompt off

console_name=${$(tty)#/dev/pts/}
PROMPT="%B%F{yellow}[${console_name}]%f%F{white}[%h]%f%F{blue}[%n@%M]%f%F{green}[%~]%(0#,#,$)%b%f "

source ~/bin/shortcuts
alias sudo="sudo "
