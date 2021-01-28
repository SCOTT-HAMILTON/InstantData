#!/bin/sh

#!/bin/bash

# get a subdir under ~/.config if it exists
# to override specific config dirs under instantdotfiles
# (this is necessary e.g. to customise rofi themes as a user)
dotconfigsub(){
    if [ -d "~/.config/${1}" ]; then
        echo "~/.config/${1}"
    else
        echo "@instantDotfiles@/${1}"
    fi
}

checkdeprecated() {
    if [ -n "$(echo "${1}" | grep -E '\-[a-z]{2,}')" ]; then
        echo "WARNING: deprecated option \"${1}\" will be removed in the future. Please use the long option \"${2}\"" >&2
    fi
}

# ppenguin:
# better to use "real" getopt (and get rid of the Q&D pattern match below), 
# but this would break non-standard "half-short" options (-wa -wi -wm) for now,
# so these should be replaced everywhere where they are called
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
    --get-userconfig-dir=*)
    optarg=$(echo $* | awk -F' ' '$1~/--get-userconfig-dir/ { match($1, /.*=(.*)/, a); print a[1] }' )
	dotconfigsub ${optarg}
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
    checkdeprecated ${1} "--get-wallpaper-dir"
	echo "@instantWALLPAPER@"
    ;;
    --get-widgets-dir|-wi)
    checkdeprecated ${1} "--get-widgets-dir"
	echo "@instantWidgets@"
    ;;
    --get-wm-dir|-wm)
    checkdeprecated ${1} "--get-wm-dir"
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
