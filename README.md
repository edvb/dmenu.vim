# dmenu.vim

A small vim plugin which provides a few commands for dmenu use in vim.

To open a file in vim with dmenu use the following, where the argument can be
any vim command, such as e, sp, vsp, etc.

	:DmenuFile "e"

To switch to a currently open buffer use the following, with again any vim
command.

	:DmenuBuf "e"

## Configuration

To change the default dmenu command put the following in your `.vimrc`

	let g:dmenu_cmd = "dmenu -i -l 20"

To change the default file list command put the following in your `.vimrc`

	let g:dmenu_ls = "find -type f -printf '%P\n' | tail -n +2"

To change the default git file list command put the following in your `.vimrc`

	let g:dmenu_git_ls= "git ls-files"

## Installation

### 1. Put Files Into Root of the `.vim` Directory (Not Recommended)

Without a plug-in manger (like the ones below) you have to manually put each
file/folder (plugin/, doc/, autoload/, etc.) into the root of your .vim folder.
I highly recommend that you use one of the plug-in mangers below for less
manual work and easier organization.

### 2. Pathogen, by tpope

To use [Pathogen](https://github.com/tpope/vim-pathogen) you first have to
install it. After the installation process, type the following command
into a terminal, assuming you have `git` installed:

	cd ~/.vim/bundle
	git clone https://gitlab.com/edvb/dmenu.vim

### 3. Vundle, by gmarik

To use [Vundle](https://github.com/gmarik/Vundle.vim) you first have to
install it by following the instructions on the repository. After the
installation process, insert the following into your `.vimrc` file:

	Plugin 'edvb/dmenu.vim'

And then type this while inside Vim:

	:source %
	:PluginInstall

### 4. NeoBundle, by Shougo

To use [NeoBundle](https://github.com/Shougo/neobundle.vim) you first have to
install it by following the instructions on the repository. After the
installation process, insert the following into your `.vimrc` file:

	NeoBundle 'edvb/dmenu.vim'

And then type this while inside Vim:

	:source %
	:NeoBundleInstall

## Author

Written by ED van Bruggen.

## Licence

Vim License. See `:help license`

