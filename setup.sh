git config --global user.name "Zach McGohan"
git config --global user.email "zmcgohan@gmail.com"
git config --global core.editor vim

# create symlink for info bar wrapper (allows full customization of text)
ln -s ~/system-config/i3status_wrapper.py ~/.i3/i3status_wrapper.py

# make sure bashrc exists
touch ~/.bashrc
# add custom bashrc commands to bottom of ~/.bashrc
cat .bashrc_custom >> ~/.bashrc

# copy custom programs to /usr/local/bin/
ln -s /usr/local/bin/* bin/
