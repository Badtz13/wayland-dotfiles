#!/bin/sh

# symlink sddm conf
cp ~/.cache/wal/theme.conf ~/.config/sddm/themes/where_is_my_sddm_theme/theme.conf

sudo cp -r /home/badtz/.config/sddm/themes/where_is_my_sddm_theme /usr/share/sddm/themes/
echo $(date) > /home/badtz/.config/sddm/log.txt
