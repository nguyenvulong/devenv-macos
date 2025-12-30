if status is-interactive
    # Commands to run in interactive sessions can go here
end

#
set PATH /Users/longnv/.local/bin $PATH
set PATH /opt/homebrew/bin $PATH
set PATH /opt/homebrew/sbin $PATH
set PATH /opt/homebrew/opt/libpq/bin $PATH

starship init fish | source

# Node
fnm env --use-on-cd --shell fish | source

# Config for dotfiles
alias config='/usr/bin/git --git-dir=/Users/longnv/.cfg/ --work-tree=/Users/longnv'

# aliases
alias ls='eza --icons=always'
alias la='ls -a'
alias ll='eza -lah'
alias l='eza -lah --classify --grid'

alias vim='v'
alias v='nvim'
alias vd='nvim -d'
alias cat='BAT_THEME=Dracula bat --paging=never --plain'

alias nvm='fnm'

function history
    builtin history --show-time="%Y-%m-%d %H:%M:%S " $argv
end

# Added by Antigravity
fish_add_path /Users/longnv/.antigravity/antigravity/bin
