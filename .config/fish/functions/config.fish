function config --wraps='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' --description 'Context-aware config for dotfiles'
  if test "$XDG_SESSION_TYPE" = "wayland"
    /usr/bin/git --git-dir=$HOME/wayland-dotfiles/ --work-tree=$HOME $argv;
  else
    /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv;
  end
end
