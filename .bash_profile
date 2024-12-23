#
# ~/.bash_profile
#
export PATH="$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH"
#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#	startx
#fi

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
