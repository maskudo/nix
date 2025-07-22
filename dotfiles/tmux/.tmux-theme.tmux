#!/usr/bin/env bash
_black="#26233a"
_blue="#9ccfd8"
_yellow="#f6c177"
_red="#eb6f92"
_white="#e0def4"
_green="#98c379"
_visual_grey="#26233a"
_comment_grey="#6e6a86"
_rosepine_green="#393552"

set() {
  local option=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

set "status-style" "bg=default"
set "status" "on"
set "status-justify" "left"
set "status-right" ""
set "status-left" " #S | "
set "status-left-length" 50
tmux set-option -wg "mode-style" "bg=#37344a,fg=$_white"
tmux set-option -g "message-style" "bg=$_visual_grey,fg=$_white"

set "window-status-format" "#[fg=$_white,bg=default] #I|#W "
set "window-status-current-format" "#[fg=$_black,bg=$_visual_grey,nobold]#[fg=$_white,bg=$_rosepine_green,nobold] #I|#W #[fg=$_visual_grey,bg=default,nobold,nounderscore,noitalics]"
