#!/bin/sh

#!/bin/bash
for i in "$@"
do
case $i in
    --get-conf-dir|-c)
	echo "@InstantConf@"
    ;;
    --get-dotfiles-dir|-d)
	echo "@InstantDotfiles@"
    ;;
    --get-logo-dir|-l)
	echo "@InstantLOGO@"
    ;;
    --get-menu-dir|-m)
	echo "@InstantMENU@"
    ;;
    --get-shell-dir|-s)
	echo "@InstantShell@"
    ;;
    --get-themes-dir|-t)
	echo "@InstantTHEMES@"
    ;;
    --get-utils-dir|-u)
	echo "@InstantUtils@"
    ;;
    --get-wallpaper-dir|-wa)
	echo "@InstantWALLPAPER@"
    ;;
    --get-widgets-dir|-wi)
	echo "@InstantWidgets@"
    ;;
    --get-wm-dir|-wm)
	echo "@InstantWM@"
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
