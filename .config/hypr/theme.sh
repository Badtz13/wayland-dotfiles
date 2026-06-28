#!/usr/bin/env bash

set -u

WALLPAPERS="$HOME/Pictures/wallpapers"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [[ -z "${1:-}" || "${1:-}" == "random" ]]; then
  mapfile -t themes < <(find "$WALLPAPERS" -mindepth 1 -maxdepth 1 -type d | sort)
  theme_path="${themes[RANDOM % ${#themes[@]}]}"
  theme="$(basename "$theme_path")"
else
  theme="$1"
fi

find_image() {
  local theme="$1"
  local img_num="$2"
  local base_path="$WALLPAPERS/$theme/$img_num"

  for ext in jpg png jpeg gif; do
    if [[ -f "$base_path.$ext" ]]; then
      printf '%s\n' "$base_path.$ext"
      return 0
    fi
  done

  return 1
}

image1="$(find_image "$theme" 1 || true)"
image2="$(find_image "$theme" 2 || true)"
image3="$(find_image "$theme" 3 || true)"

if [[ -z "$image1" ]]; then
  notify-send "Theme failed" "No 1.jpg/png/jpeg/gif found for $theme"
  exit 1
fi

hyprctl hyprpaper unload all >/dev/null 2>&1

[[ -n "$image1" ]] && hyprctl hyprpaper preload "$image1" >/dev/null
[[ -n "$image2" ]] && hyprctl hyprpaper preload "$image2" >/dev/null
[[ -n "$image3" ]] && hyprctl hyprpaper preload "$image3" >/dev/null

[[ -n "$image1" ]] && hyprctl hyprpaper wallpaper "DP-2,$image1" >/dev/null
[[ -n "$image2" ]] && hyprctl hyprpaper wallpaper "DP-3,$image2" >/dev/null
[[ -n "$image3" ]] && hyprctl hyprpaper wallpaper "HDMI-A-1,$image3" >/dev/null

wpg -s "$image1" -n || true
wal -q -i "$image1"

[[ -x "$XDG_CONFIG_HOME/dunst/wal.sh" ]] && "$XDG_CONFIG_HOME/dunst/wal.sh"
[[ -x "$XDG_CONFIG_HOME/spicetify/Themes/Pywal/update-colors.sh" ]] && "$XDG_CONFIG_HOME/spicetify/Themes/Pywal/update-colors.sh"

command -v pywal-discord >/dev/null && pywal-discord -t default -p "$HOME/.config/vesktop/themes/"

if [[ -x "$XDG_CONFIG_HOME/wpg/wp_init.sh" ]]; then
  "$XDG_CONFIG_HOME/wpg/wp_init.sh"
fi

conf="$XDG_CONFIG_HOME/hypr/hyprpaper.conf"
command -v pywalfox >/dev/null && pywalfox update

{
  echo "splash = false"
  echo

  if [[ -n "$image2" ]]; then
    cat <<EOF
wallpaper {
    monitor = DP-3
    path = $image2
    fit_mode = cover
}

EOF
  fi

  if [[ -n "$image1" ]]; then
    cat <<EOF
wallpaper {
    monitor = DP-2
    path = $image1
    fit_mode = cover
}

EOF
  fi

  if [[ -n "$image3" ]]; then
    cat <<EOF
wallpaper {
    monitor = HDMI-A-1
    path = $image3
    fit_mode = cover
}
EOF
  fi
} > "$conf"

notify_color="$(sed -n '12p' "$XDG_CACHE_HOME/wal/colors" 2>/dev/null | tr -d '\n')"
notify-send "Theme set to" "$theme" -h "string:x-hyprnotify-color:$notify_color" -t 2000

rm -f "$HOME/.fehbg"

hyprctl reload