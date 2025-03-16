#!/usr/bin/env bash


# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
eval "$(/opt/homebrew/bin/brew shellenv)";
brew bundle;


# Shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/completions;


# Integration
$(brew --prefix)/opt/fzf/install


# Additional
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
vim +'PlugInstall --sync' +qa;
git clone https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim;

wget --output-document ~/delta-themes.gitconfig https://raw.githubusercontent.com/dandavison/delta/master/themes.gitconfig


# Framework
mise use -g usage

mise use --global node@18
mise use -g java@corretto-8
mise use -g java@corretto-11
mise use -g java@corretto-22
mise use -g java@corretto-23

mise use -g go@1.24

mise use -g ruby@3.2


mise plugins install scala
mise use -g scala@2.13.16



# Initialize the dotfiles
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig;
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf;
ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc;
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc;
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc;

ln -s $HOME/dotfiles/hammerspoon.lua $HOME/.hammerspoon/init.lua;

mkdir -p $HOME/.local/share/gh/extensions
