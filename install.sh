#!/usr/bin/env bash
ruby=`which ruby`

function add_alias() {
	cd ~/.def-clear
	defclear=`find $HOME/.def-clear -iname "def*" -print`
	echo "alias def-clear='"$ruby" "$defclear"'" >> $1
}

if 	[ -e ~/.aliases ]
then
	add_alias ~/.aliases	
elif [ -e ~/.profile ]
then
	add_alias ~/.profile
elif [ -e ~/.bashrc  ]
then
	add_alias ~/.bashrc
else
	echo "ERROR: Could not find ~/.aliases, ~/.profile or ~/.bashrc"
fi
