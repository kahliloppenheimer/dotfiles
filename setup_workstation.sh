#!/bin/bash
############################
# This script eases the process of moving to new workstations. All you have to
# do is put all of your "dotfiles" (i.e. .vimrc, .zshrc, etc.) into a folder
# whose name you specify ($dir) without a '.' before each of their names. Then
# run the script.
#
# If you store this script and your dotfiles directory in a git repo, then all
# you need to do when moving to a new workstation is
#
# git clone https://github.com/YourName/YourRepo.git
# YourRepo/setup_workstation
#
# Here is what the script actually does:
#
# 1) Move all existing dotfiles from ~/ into $olddir
# 2) Symlink all of the dotfiles from $dir into your home directory
# 3) Install homebrew (if necessary)
# 4) Install git (if necessary)
# 5) Install Vundle (vim plugin manager) if necessary
# 6) Install vim plugins specified in your vimrc using Vundle
# 7) Install zsh (if necessary) and set it to be your default shell
#
# @author https://github.com/kahliloppenheimer
############################


# Create necessary variable bindings for the rest of the script
setup_environment() {
    # New directory in which you want to store all of your new dot files
    dir=~/dotfiles
    
    # Old directory to which you want to move all of your old dot files
    olddir=~/dotfiles_old

    # list of files/folders to symlink from ~/ into dotfiles
    # (each name should be preceded by a '.', i.e. '.vimrc' or '.zshrc')
    files="vimrc zshrc oh-my-zsh global_aliases screenrc gitignore_global default.tex"

    # Current OS (notably Linux = 'Linux' and OS X = 'Darwin')
    platform=$(uname)

    # Custom zshTheme if you have one (to symlink into proper directory in
    # oh-my-zsh)
    zshTheme=kdawg.zsh-theme
}

# Moves old dotfiles into specified directory and symlinks new dotfiles
# into home directory
create_dotfiles() {
    # create dotfiles_old in homedir
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir

    # change to the dotfiles directory
    echo -n "Changing to the $dir directory ..."
    cd $dir

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
    echo "Moving any existing dotfiles from ~ to $olddir"
    for file in $files; do
        mv ~/.$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
}

# Installs Homebrew if necessary
install_homebrew() {
    if [[ ! -f /usr/local/bin/brew && $platform == 'Darwin' ]]; then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    fi
}

# Installs git if necessary
install_git() {
    if ! hash git 2> /dev/null; then
        echo "Installing git..."
        brew install git
    fi
    echo "Setting .gitignore_global as global gitignore file..."
    git config --global core.excludesfile ~/.gitignore_global > /dev/null
}

# Installs Vundle and installs all vim plugins specified in vimrc if necessary
setup_vundle() {
    if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
        echo "Cloning github:gmarik/Vundle into ~/.vim/bundle/Vundle.vim"
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    echo "Installing Vundle plugins in vim..."
    vim +PluginInstall +qall &> /dev/null
}

# Installs zsh and sets up with 
install_zsh () {
# Test to see if zshell is installed.  If it is:
if [[ -f /bin/zsh || -f /usr/bin/zsh ]]; then
    # Clone oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone https://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh) > /dev/null
    fi
    # Symlinks specified zsh-theme into the proper directory
    ln -s $dir/$zshTheme $dir/oh-my-zsh/themes/$zshTheme

else
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh > /dev/null
        install_zsh
    # If the platform is OS X, try using brew to install zsh and then recurse
    elif [[ $platform == 'Darwin' ]]; then
        brew install zsh > /dev/null
        install_zsh
    fi
fi
}

setup_environment
create_dotfiles
install_homebrew
install_git
setup_vundle
install_zsh
