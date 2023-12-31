#!/bin/bash

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

# make sure swww daemon is running 
if ! swww query; then
    swww init
fi

# make sure images were found 
image1=$(find_image $THEME 1)
image2=$(find_image $THEME 2)
image3=$(find_image $THEME 3)

# generate pywal scheme
[ "$image1" != "Error: No image found." ] && wal -q -i "$image1" 

# set wallpapers if they were found
[ "$image1" != "Error: No image found." ] && swww img -o DP-2 "$image1"  --transition-type none
[ "$image2" != "Error: No image found." ] && swww img -o DP-3 "$image2" --transition-type none
[ "$image3" != "Error: No image found." ] && swww img -o HDMI-A-1 "$image3" --transition-type none

# run pywal scripts
pywalfox update
sh $HOME/.config/dunst/wal.sh
sh $HOME/.config/spicetify/Themes/Pywal/update-colors.sh 
