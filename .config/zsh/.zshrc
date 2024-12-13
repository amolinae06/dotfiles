# Enable colors and change prompt:
case $(tty) in /dev/tty[0-9]*)
    source .cache/wal/colors-tty.sh
esac

autoload -U colors && colors    # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[yellow]%}%M %{$fg[yellow]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd           # Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Useful options
setopt correct
setopt noclobber
setopt histignoredups

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Basic auto/tab complete:
setopt auto_list
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# Completion files: Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

# Aliases
alias ssh='dbclient'
alias sudo='doas'
alias neofetch='fastfetch'
alias yay='paru'
alias docker='podman'
alias ls='ls -lah'
alias codium='codium --ozone-platform=wayland'
alias cmatrix='cmatrix -bcm -u 7'
alias stmps='stmps -mpris'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Commands
fastfetch

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
