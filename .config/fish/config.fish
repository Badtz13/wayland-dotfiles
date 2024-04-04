set -x LC_ALL en_US.UTF-8

complete -f -c theme  # Remove all existing completions for 'theme'
complete -c theme -a '(__theme_dirs)'  # Add your specific completion
cat ~/.cache/wal/sequences