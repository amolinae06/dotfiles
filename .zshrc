# Enable colors and change prompt:
autoload -U colors && colors    # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[yellow]%}%M %{$fg[yellow]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd           # Automatically cd into typed directory.
stty stop undef         # Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# Commands
fastfetch

# Aliases
alias sudo='doas'
alias neofetch='fastfetch'
alias yay='paru'
alias vim='nvim'
alias docker='podman'
alias ls='ls -lah'
alias codium='codium --ozone-platform=wayland'

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
