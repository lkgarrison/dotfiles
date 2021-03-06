#!/bin/bash

# Setup Vundle (Plugin Manager)
vundle_repo="https://github.com/VundleVim/Vundle.vim.git"
vundle_dir="$HOME/.vim/bundle/"
vundle_file="$HOME/.vim/bundle/Vundle.vim"

# Clone Vundle Plugin Manager if it wasn't already
if [ ! -e $(eval echo $vundle_file) ]
then
	eval git clone "$vundle_repo" "$vundle_dest$vundle_file"
fi

# Install plugins specified in .vimrc
eval "vim +PluginInstall +qall"

# copy .colors files into .vim/colors/
monokai_colors_file_name="monokai.vim"
monokai_colors_source_file=${vundle_dir}"vim-monokai/colors/${monokai_colors_file_name}"
vim_colors_dir="$HOME/.vim/colors/"

if [ ! -e $vim_colors_dir/$monokai_colors_file_name ]
then
	if [ -e $monokai_colors_source_file ]
	then
		# create vim colors directory if it doesn't exist
		if [ ! -d $vim_colors_dir ]
		then
			echo Making new directory: $vim_colors_dir
			eval mkdir $vim_colors_dir
		fi

		# copy monokai colors file into vim colors dir
		echo Copying Monokai colors into proper VIM colors directory
		eval cp "$monokai_colors_source_file $vim_colors_dir"
	else
		echo ERROR: Monokai colors do not exist. Check .vimrc for correct plugin.
	fi
fi

# install flake8 for python syntax/styling checker if it doesn't exist
if ! [ -x "$(command -v flake8)"  ]; then
	echo "Installing flake8"
	eval pip install -q --user flake8
fi
