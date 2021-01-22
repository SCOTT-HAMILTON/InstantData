#!/bin/sh

#!/bin/bash

# get a subdir under ~/.config if it exists
# to override specific config dirs under instantdotfiles
# (this is necessary e.g. to customise rofi themes as a user)
dotconfigsub(){
    if [ -d "${1}" ]; then
        echo "~/.config/${1}"
    else
        echo "@instantDotfiles@/${1}"
    fi
}


for i in "$@"
do
case $i in
    --get-assist-dir|-a)
	echo "@instantASSIST@"
    ;;
    --get-conf-dir|-c)
	echo "@instantConf@"
    ;;
    --get-dotfiles-dir|-d)
	echo "@instantDotfiles@"
    ;;
    --get-userconfig-dir|-uc)
	dotconfigsub()
    ;;
    --get-logo-dir|-l)
	echo "@instantLOGO@"
    ;;
    --get-menu-dir|-m)
	echo "@instantMENU@"
    ;;
    --get-shell-dir|-s)
	echo "@instantShell@"
    ;;
    --get-themes-dir|-t)
	echo "@instantTHEMES@"
    ;;
    --get-utils-dir|-u)
	echo "@instantUtils@"
    ;;
    --get-wallpaper-dir|-wa)
	echo "@instantWALLPAPER@"
    ;;
    --get-widgets-dir|-wi)
	echo "@instantWidgets@"
    ;;
    --get-wm-dir|-wm)
	echo "@instantWM@"
    ;;
    --get-paperbash-dir|-p)
	echo "@Paperbash@"
    ;;
    --get-rangerplugins-dir|-r)
	echo "@rangerplugins@"
    ;;
    *)
		# unknown option
		exit 1
    ;;
esac
done
