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
mise install node@16
mise install pmpm@10

mise use -g java@corretto-8
mise install java@corretto-8;
mise install java@corretto-11;
mise install java@17;
mise install java@23;

mise use -g go@1.24

mise use -g ruby@3.2

mise plugin install maven
mise install maven@3.5
mise use -g maven@3

mise use -g gradle@8

mise plugins install scala
mise use -g scala@2.13
mise install scala@2.12

mise plugin add poetry
mise use -g poetry@2



# Initialize the dotfiles
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig;
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf;
ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc;
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc;
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc;

mkdir -p $HOME/.config/mise;
ln -s $HOME/dotfiles/mise.toml $HOME/.config/mise/config.toml;

ln -s $HOME/dotfiles/hammerspoon.lua $HOME/.hammerspoon/init.lua;

mkdir -p $HOME/.local/share/gh/extensions
