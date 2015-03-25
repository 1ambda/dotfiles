## Mac OS

### Tools

- brew, wget, curl, tree
- peco
- fasd
- Xcode
- zsh, antigen
- [trash-cli](https://github.com/andreafrancia/trash-cli)
- [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
- [vundle](https://github.com/gmarik/Vundle.vim)
- [macvim](http://stackoverflow.com/questions/21012203/gvim-or-macvim-in-mac-os-x)
- [reattach-to-user-namespace](http://evertpot.com/osx-tmux-vim-copy-paste-clipboard/)

### Python

- [pyenv](https://github.com/yyuu/pyenv)
- [virtualenv](https://github.com/yyuu/pyenv-virtualenv)
- [autoenv](https://github.com/kennethreitz/autoenv)

### Node

- [nvm](https://github.com/creationix/nvm)

### Emacs

(1) Build [emacs-mac-port](https://github.com/railwaycat/emacs-mac-port)  

```
$ git clone git://github.com/railwaycat/emacs-mac-port.git
$ brew install autoconf automake libtool
$ ./configure --with-mac --enable-mac-app
$ make && make install
```

(2) Configure [.emacs](https://github.com/1ambda/emacs-osx)

### Powerline

- [ref 1](http://powerline.readthedocs.org/en/latest/installation/osx.html?highlight=install)
- [ref 2](http://blog.outsider.ne.kr/879)

```
$ pip install powerline-status
$ brew install Caskroom/cask/xquartz
$ brew update && brew install -vd fontforge
$ # set powerline font for non-ascii chars 
```

### Keys

- [replace Capslock to Escape](http://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x)
- [use Command_R as HanEng key](http://jaebok.tistory.com/38)
- Spotlight: `Op-S`, Finder: `Op-F`, Dashboard: `Op-L`, Dock: 'Op-D'

### 3rd-party Apps

- [Sizeup](http://www.irradiatedsoftware.com/sizeup/), [Cinch](http://www.irradiatedsoftware.com/cinch/) (Window Mgmt)
- Karabiner
- Seil
