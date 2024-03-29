#!/bin/sh

#colors
c1="\033[7;30m  \033[0;1;30m"
c2="\033[7;31m  \033[0;1;31m"
c3="\033[7;32m  \033[0;1;32m"
c4="\033[7;33m  \033[0;1;33m"
c5="\033[7;34m  \033[0;1;34m"
c6="\033[7;35m  \033[0;1;35m"
c7="\033[7;36m  \033[0;1;36m"
c8="\033[7;37m  \033[0;1;37m"
end="\033[1;0m"

#import info
. /etc/os-release

#get info functions 
Name() {
  read -r host < /etc/hostname;
  printf "$(whoami)@$host";
}
Os() { printf $NAME; }
Packages() {
  printf $(pacman -Qq | wc -l);
}
Uptime() {
  IFS=. read -r up _ < /proc/uptime;
  printf "$((up / 60 / 60 / 24))D $((up / 60 / 60 % 24))H $((up / 60 % 60))M";
}
Shell() { printf "$( printf ${SHELL##*/} )"; }
Desktop() { 
  if type "$XDG_CURRENT_DESKTOP" >/dev/null; then
    printf "$XDG_CURRENT_DESKTOP\n"
  elif type "$DESKTOP_SESSION" >/dev/null; then
    printf "$DESKTOP_SESSION\n"
  else  
    for i in /proc/*/comm; do
      read -r p < "$i"
      case $p in
        awesome|xmonad*|qtile|sway|i3|[bfo]*box|*wm*) printf "${c%%-*}"; break;;
      esac
    done
  fi
}
Memory() {
  while IFS=':k ' read -r mem1 mem2 _; do
    case $mem1 in
      MemTotal)
        memt=$(( $mem2 / 1024 ));;
      MemAvailable)
        memu=$(($memt - $mem2 / 1024));;
    esac;
  done < /proc/meminfo;
  printf "$memu""Mib"" / ""$memt""Mib";
}
Theme() {
  printf $(cat $HOME/.config/hypr/current/theme)
}

help() { printf "${c2} Usage: fetch [-n|o|k|u|s|d|m|h]
${c3} Options:
${c4}   [Name|Os|Kernel|Uptime|Shell|Desktop|Memory|Help]
${c5} Example Usage:
${c6}   fetch -nosd"; }

default() {
  printf "${c2} $(Name)\n"
  printf "${c3} Os: $(Os)\n"
  printf "${c4} Packages: $(Packages)\n"
  printf "${c5} Uptime: $(Uptime)\n"
  printf "${c6} Shell: $(Shell)\n"
  printf "${c7} WM: $(Desktop)\n"
  printf "${c8} Theme: $(Theme)\n"
}

if [ "$1" != "" ]; then
  while getopts ":nokusdm" option; do
    case $option in
      n)
        printf "${c2} $(Name)\n";;
      o)
        printf "${c3} Os: $(Os)\n";;
      k)
        printf "${c4} Packages: $(Packages)\n";;
      u)
        printf "${c5} Uptime: $(Uptime)\n";;
      s)
        printf "${c6} Shell: $(Shell)\n";;
      d)
        printf "${c7} DE/WM: $(Desktop)\n";;
      m)
        printf "${c8} Memory: $(Memory)\n";;
      \?)
        help
        break;;
    esac
  done
else
  default;
fi
# printf "\n"
