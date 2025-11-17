if status is-interactive
    # Commands to run in interactive sessions can go here
end

#
set PATH $PATH /Users/longnv/.local/bin
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /opt/homebrew/opt/libpq/bin

starship init fish | source

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

function history
    builtin history --show-time="%Y-%m-%d %H:%M:%S " $argv
end
