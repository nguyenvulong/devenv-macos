# PATH (typeset -U drops duplicates, so nested shells don't grow it)
typeset -U path fpath

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

path=(
  $HOME/.local/bin
  /opt/homebrew/opt/libpq/bin
  $path
)

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY     # save timestamps
setopt SHARE_HISTORY        # share history between open shells
setopt HIST_IGNORE_DUPS     # skip consecutive duplicates
setopt HIST_IGNORE_SPACE    # skip commands starting with a space
setopt HIST_REDUCE_BLANKS

# Completion (zsh-completions adds definitions for many extra tools)
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  fpath=($HOMEBREW_PREFIX/share/zsh-completions $HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
fi
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' menu select

# Emacs-style line editing (Ctrl-A, Ctrl-E, ...)
bindkey -e

# Prompt
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# Node
if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd --shell zsh)"
  alias nvm='fnm'
fi

# fzf key bindings: Ctrl-R history, Ctrl-T files, Alt-C directories
if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi

# Config for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Aliases
if (( $+commands[eza] )); then
  alias ls='eza --icons=always'
  alias ll='eza -lah'
  alias l='eza -lah --classify --grid'
  alias tree='eza --tree'
fi
alias la='ls -a'

alias v='nvim'
alias vim='nvim'
alias vd='nvim -d'

if (( $+commands[bat] )); then
  alias cat='BAT_THEME=Dracula bat --paging=never --plain'
fi

alias history='fc -li 1'

# Plugins (keep zsh-syntax-highlighting last)
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  if [[ -r $HOMEBREW_PREFIX/share/$plugin/$plugin.zsh ]]; then
    source $HOMEBREW_PREFIX/share/$plugin/$plugin.zsh
  fi
done
unset plugin

# Machine-specific settings that shouldn't be committed
if [[ -r ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
