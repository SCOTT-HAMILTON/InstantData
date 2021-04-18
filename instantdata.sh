#!/bin/sh

#!/bin/bash

# get a subdir under ~/.config if it exists
# to override specific config dirs under instantdotfiles
# (this is necessary e.g. to customise rofi themes as a user)
dotconfigsub(){
    if [ -d ~/".config/${1}" ]; then
        echo ~/".config/${1}"
    else
        echo "@instantDotfiles@/share/instantdotfiles/${1}"
    fi
}

checkdeprecated() {
    if [ -n "$(echo "${1}" | grep -E '^\-[a-z]{1,}')" ]; then
        echo "WARNING: deprecated option \"${1}\" will be removed in the future. Please use the long option \"${2}\"" >&2
    fi
}

# ppenguin:
# better to use "real" getopt (and get rid of the Q&D pattern match below), 
# but this would break non-standard "half-short" options (-wa -wi -wm) for now,
# so these should be replaced everywhere where they are called

# don't loop over options, they're mutually exclusive anyway
case ${1} in
    --get-assist-dir|-a)
	checkdeprecated ${1} "--get-assist-dir"
	echo "@instantASSIST@"
    ;;
    --get-conf-dir|-c)
	checkdeprecated ${1} "--get-conf-dir"
	echo "@instantConf@"
    ;;
    --get-dotfiles-dir|-d)
	checkdeprecated ${1} "--get-dotfiles-dir"
	echo "@instantDotfiles@"
    ;;
    --get-userconfig-dir=*)
    optarg=$(echo $* | awk -F' ' '$1~/--get-userconfig-dir/ { match($1, /.*=(.*)/, a); print a[1] }' )
	dotconfigsub ${optarg}
    ;;
    --get-logo-dir|-l)
	checkdeprecated ${1} "--get-logo-dir"
	echo "@instantLOGO@"
    ;;
    --get-menu-dir|-m)
	checkdeprecated ${1} "--get-menu-dir"
	echo "@instantMENU@"
    ;;
    --get-shell-dir|-s)
	checkdeprecated ${1} "--get-shell-dir"
	echo "@instantShell@"
    ;;
    --get-themes-dir|-t)
	checkdeprecated ${1} "--get-themes-dir"
	echo "@instantTHEMES@"
    ;;
    --get-utils-dir|-u)
	checkdeprecated ${1} "--get-utils-dir"
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
	checkdeprecated ${1} "--get-paperbash-dir"
	echo "@Paperbash@"
    ;;
    --get-rangerplugins-dir|-r)
	checkdeprecated ${1} "--get-rangerplugins-dir"
	echo "@rangerplugins@"
    ;;
    *)
		# unknown option
        echo "Error: unknown option \"${1}\"" >&2
		exit 1
    ;;
esac

