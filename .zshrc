if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  kubectl
  git
  fzf-tab
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Local bin
export PATH=$PATH:/Users/longnv/.local/bin

# Ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH="$PATH:$HOME/.gem/ruby/3.4.0/bin"
export PATH="$PATH:/opt/homebrew/opt/ruby/bin"

# Nodejs
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Config for dotfiles
alias config='/usr/bin/git --git-dir=/Users/longnv/.cfg/ --work-tree=/Users/longnv'

# Aliases
alias v="nvim"
alias vd="nvim -d"
alias cat="BAT_THEME=DarkNeon bat --paging=never --plain"
alias ls="eza --icons=always"
alias ll="eza -lh"
alias l="eza -lah --classify --grid"
alias tree="eza --tree"

# Terminal
export TERM=xterm-256color

# Wezterm
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Ollama
export OLLAMA_API_BASE=http://127.0.0.1:11434
