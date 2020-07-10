#!/bin/sh

#!/bin/bash
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
