: '
This is my personal config file for all Linux operating systems. It is
written so that you (or, more likely me, I guess) can simply run the 
script on a new installation and have a fully configured system. 

Git should be installed and this repo cloned, but other than that there
should not be any further manual work unless noted.
'

# UBUNTU
sudo apt-get -y install vim python i3 chromium-browser
sudo apt-get -y install nodejs npm
sudo apt-get -y install libopencv-dev python-opencv

# Bashrc setup
# make sure bashrc exists
touch ~/.bashrc
# add custom bashrc commands to bottom of ~/.bashrc
cat .bashrc_custom >> ~/.bashrc

# Git setup
git config --global user.name "Zach McGohan"
git config --global user.email "zmcgohan@gmail.com"
git config --global core.editor vim

# i3 setup
# Install
echo 'deb http://dl.bintray.com/i3/i3-autobuild-ubuntu wily main' > /etc/apt/sources.list.d/i3-autobuild.list
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install i3-autobuild-keyring
sudo apt-get update
sudo apt-get -y install i3
# Create i3 folder in home directory
mkdir -p ~/.i3
# Create symbolic link to config file
ln -s $(pwd)/i3wm/config ~/.i3/config
# create symlink for info bar wrapper (allows full customization of text)
ln -s $(pwd)/i3wm/i3status_wrapper.py ~/.i3/i3status_wrapper.py

# Vim setup
# Clone Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install plugins
vim +PluginInstall +qall
# Create symbolic link to config file
ln -s $(pwd)/.vimrc ~/.vimrc

# Create SSH folder if it doesn't exist
mkdir -p ~/.ssh
# Set permissions
chmod 700 ~/.ssh
chmod 644 ssh/id_rsa.pub
chmod 600 ssh/id_rsa
# Create symlinks for SSH keys
cp -rs $(pwd)/ssh/* ~/.ssh/
# Pass new SSH identity to ssh-agent
# TODO this probably won't work on leaner OSes
ssh-add

# Create projects, projects/testing and projects/resources folder
mkdir -p ~/projects/testing
mkdir ~/projects/resources

# create symlinks for custom programs in /usr/local/bin/
cp -rs $(pwd)/bin/* /usr/local/bin/

