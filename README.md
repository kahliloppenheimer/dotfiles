Setup Workstation
=================

This script eases the process of moving to new workstations.

All you have to do is put all of your **dotfiles** (i.e. .vimrc, .zshrc, etc.) into a folder *$dir*. Each file in *$dir* should **not** be preceded by a (**.**). Once you have *$dir* setup, simply run this script.

If you store this script and *$dir* in a git repo, then all
you need to do when moving to a new workstation is:

* git clone https://github.com/YourName/YourRepo.git
* YourRepo/setup_workstation

Here is what the script actually does:
--------------------------------------
1. Move all existing dotfiles from ~/ into $olddir
2. Symlink all of the dotfiles from $dir into your home directory
3. Install homebrew (if necessary)
4. Install git (if necessary)
5. Install Vundle (vim plugin manager) if necessary
6. Install vim plugins specified in your vimrc using Vundle
7. Install zsh (if necessary) and set it to be your default shell
