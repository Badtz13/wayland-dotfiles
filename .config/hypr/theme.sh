#!/bin/bash

# Function to wait for hyprpaper to be running
function wait_for_hyprpaper {
    while ! pgrep -x "hyprpaper" > /dev/null; do
        sleep 1
    done
    echo "hyprpaper is running, proceeding with setting wallpapers..."
}

# Wait for hyprpaper to be running
wait_for_hyprpaper
sleep 3

# If "random" is passed, select a random theme folder
if [ "$1" == "random" ]; then
  themes=($HOME/Pictures/wallpapers/*)
  rand_theme=${themes[RANDOM % ${#themes[@]}]}
  theme=$(basename "$rand_theme")
else
  theme=$1
fi

# locate theme images, find proper file extensions 
function find_image {
  local theme=$1
  local img_num=$2
  local base_path="$HOME/Pictures/wallpapers/$theme/$img_num"

  for ext in jpg png jpeg gif; do
    if [[ -f "$base_path.$ext" ]]; then
      echo "$base_path.$ext"
      return 0
    fi
  done

  echo "Error: No image found."
  return 1
}

# Adjust the theme variable for image finding
image1=$(find_image $theme 1)
image2=$(find_image $theme 2)
image3=$(find_image $theme 3)

hyprctl hyprpaper unload all

# set wallpapers if they were found
[ "$image1" != "Error: No image found." ] && hyprctl hyprpaper preload "$image1" 
[ "$image2" != "Error: No image found." ] && hyprctl hyprpaper preload "$image2" 
[ "$image3" != "Error: No image found." ] && hyprctl hyprpaper preload "$image3" 


hyprctl hyprpaper wallpaper "DP-2, $image1"
hyprctl hyprpaper wallpaper "DP-3, $image2"
hyprctl hyprpaper wallpaper "HDMI-A-1, $image3"


# generate gtk theme
wpg -s $image1

# generate pywal scheme
[ "$image1" != "Error: No image found." ] && wal -q -i "$image1" 

# run pywal scripts
pywalfox update
sh $HOME/.config/dunst/wal.sh
sh $HOME/.config/spicetify/Themes/Pywal/update-colors.sh 

pywal-discord -t default
$HOME/.config/wpg/wp_init.sh

# notify theme
notify-send "Theme set to" $theme -t 2000

# store current theme
echo $theme > $HOME/.config/hypr/current/theme

# update sddm background
convert $image1 -resize 1920x1200\! -quality 100  $HOME/.config/sddm/themes/where_is_my_sddm_theme/background.png
sh $HOME/.config/sddm/wal.sh
