#!/bin/bash 
rm -rf ~/.vim ~/.vimrc ~/.config/fish/config.fish ~/.tmux ~/.tmux.conf 2> /dev/null

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/fish_dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/fish_dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/fish_dotfiles/vimrc ~/.vimrc

chsh -s /usr/local/bin/fish

vim -c ":PlugInstall" +qall

cd ~/.vim/plugged/YouCompleteMe
./install.py --all
