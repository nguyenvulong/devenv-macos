if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

#
set PATH $PATH /home/longnv/.local/bin

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
