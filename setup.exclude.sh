#!/bin/bash

# From https://raw.githubusercontent.com/ajmalsiddiqui/dotfiles/master/bootstrap.exclude.sh
# TODO: Original also has auto-install script.  Do I need that?

PROMPT='[setup]'
source .exports

# Initialize a few things
init () {
	echo "$PROMPT Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

link () {
	echo "$PROMPT This utility will symlink the files in this repo to the home directory"
	echo "$PROMPT Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md|LICENSE' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		# TODO: source files here?
		echo "$PROMPT Symlinking complete"
	else
		echo "$PROMPT Symlinking cancelled by user"
		return 1
	fi
} # end link

init
link
