# PATH (--move keeps these ahead of entries already set by path_helper)
fish_add_path --move --path /opt/homebrew/opt/libpq/bin /opt/homebrew/sbin /opt/homebrew/bin $HOME/.local/bin

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    # Node
    if type -q fnm
        fnm env --use-on-cd --shell fish | source
        alias nvm='fnm'
    end

    # Config for dotfiles
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    # aliases
    if type -q eza
        alias ls='eza --icons=always'
        alias ll='eza -lah'
        alias l='eza -lah --classify --grid'
    end
    alias la='ls -a'

    alias v='nvim'
    alias vim='nvim'
    alias vd='nvim -d'

    if type -q bat
        alias cat='BAT_THEME=Dracula bat --paging=never --plain'
    end

    function history
        builtin history --show-time="%Y-%m-%d %H:%M:%S " $argv
    end
end
