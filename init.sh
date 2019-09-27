#!/bin/bash 
rm -rf ~/.vim ~/.vimrc ~/.config/fish/config.fish ~/.config/fish/functions ~/.config/fish/completions ~/.config/flake8 ~/.tmux ~/.tmux.conf 2> /dev/null

brew install fish
brew install tmux

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/fish_dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/fish_dotfiles/functions/ ~/.config/fish/functions
ln -s ~/fish_dotfiles/completions ~/.config/fish/completions
ln -s ~/fish_dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/fish_dotfiles/vimrc ~/.vimrc
ln -s ~/fish_dotfiles/flake8 ~/.config/flake8

chsh -s /usr/local/bin/fish

vim -c ":PlugInstall" +qall

cd ~/.vim/plugged/YouCompleteMe
./install.py --all
