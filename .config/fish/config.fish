set -x LC_ALL en_US.UTF-8

complete -f -c theme  # Remove all existing completions for 'theme'
complete -c theme -a '(__theme_dirs)'  # Add your specific completion
cat ~/.cache/wal/sequences

if test -z "$DISPLAY" && test (tty) = "/dev/tty1"
    exec start-hyprland
end

set -Ux fish_user_paths /home/badtz/.cargo/bin $fish_user_paths

zoxide init fish | source
alias cd='z'
export EDITOR=nano
