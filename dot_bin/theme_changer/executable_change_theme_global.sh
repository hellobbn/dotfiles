#!/bin/bash

print_help() {
  echo "Usage: $0 -c light|dark"
}

change_kitty_theme() {
  kitty +kitten themes --reload-in=all $1
}

change_gnome_settings() {
  gsettings set org.gnome.desktop.interface gtk-theme $1
  gsettings set org.gnome.shell.extensions.user-theme name $1
  gsettings set org.gnome.desktop.interface color-scheme $2
}

change_nvim_theme() {
  echo "set background=$1" > /home/bbn/.config/lvim/nvim.color
}


while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -c|--color)
      case "$2" in
        light)
          THEME_COLOR=1
          shift
          ;;
        dark)
          THEME_COLOR=2
          shift
          ;;
        *)
          print_help
          exit 1
          ;;
      esac
      shift
      ;;
  esac
done

if [ -z ${THEME_COLOR+x} ]; then
  print_help
  exit 1
fi


if [ $THEME_COLOR -eq 1 ]; then
  # Change color to light
  change_kitty_theme "Ayu Light"
  change_gnome_settings "Qogir-light" "prefer-light"
  change_nvim_theme "light"
elif [ $THEME_COLOR -eq 2 ]; then
  # Change color to dark
  change_kitty_theme "Ayu Mirage"
  change_gnome_settings "Qogir-dark" "prefer-dark"
  change_nvim_theme "dark"
else
  print_help
fi

