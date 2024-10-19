# ~/.config/fish/config.fish

set fish_greeting ""

# Set environment / exports
set -Ux TERM xterm-256color
set -Ux EDITOR nvim

# Path
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin

# General aliases
alias c clear
alias :q exit # because sometimes my fingers are stupid
alias rmf 'rm -rf' # CAREFULL!!
alias mkdir 'mkdir -p'

# Eza
alias l 'eza -al --color=always --group-directories-first --git'
alias lt 'eza --tree --level=2 --long --icons --git'

# Zoxide
alias z __zoxide_z
alias zi __zoxide_zi
alias za 'zoxide add .'
alias ze 'zoxide edit'

# System
alias sf 'source ~/.config/fish/config.fish'
alias sp startplasma-wayland
alias hypr Hyprland
alias sh 'echo $SHELL' # which shell in use

# Titus Tech Linutil
alias linutil 'curl -fsSL https://christitus.com/linux | bash'

# Restic
alias backup 'restic -r /media/restic/home/ --verbose backup /home/taz/ --exclude=".src"'
alias snapshots 'restic -r /media/restic/home snapshots'
alias latest 'restic -r /media/restic/home ls latest | bat'

# Navigation
alias .1 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'

# App aliases
alias v nvim
alias vi nvim
# alias y yazi # replaced with function below
alias ff fastfetch
alias zed zeditor

# Github aliases
alias lg lazygit
alias gl 'git log --graph --oneline'
alias gs 'git status'
alias gd 'git diff'
alias gf 'git fetch'
alias go 'git checkout'
alias gp 'git pull'
alias ga 'git add'
alias gb 'git branch'
alias gba 'git branch -a'
alias graph 'git log --all --decorate --oneline --graph'

# Path alias
alias path "echo $PATH | tr ':' '\n'"

# USB mnt
alias mms 'udisksctl mount -b /dev/sdb'
alias lms 'ln -sf /run/media/taz/transfer ~/Sony'
alias ums 'umount /dev/sdb && rm ~/Sony'

# Yazi shell wrapper

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Starship transient prompt

#function starship_transient_prompt_func
#    starship module character
#end

# Tre

function tre
    command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null
end

if status is-interactive
    zoxide init fish | source
    fzf --fish | source
    starship init fish | source
    # enable_transience
end


## EOF ##
