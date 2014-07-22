# Ubuntu 14.04 Configuration

## 1. Default Application Install

```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install git wget curl ssh xclip

$ # register ssh key on Github
$ # install chrome dropbox
```

### 1.1 vim

####  Vim source build

see https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
<br/>
```
cp dotfiles/.vimrc ~/.vimrc
```

#### vundle
```
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
```

#### vim-powerline

see http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

### 1.3 Productivity

```
$ # Autojump
$ sudo apt-get autojump # and edit .zshrc to add plugin


<br>
## 2. Appearance Setting

### 2.1 Font
```
sudo apt-get install unity-tweek-tool
```

### 2.2 Appearance
```
enable workspace
autoi hide launcher on
launcher icon size : 40
```

### 2.3 Brightness & Lock
```
Turn screen off when inactive for : 10 minutes
```

### 2.4 Shell : ZSH
```
$ sudo apt-get install zsh
$ curl -L http://install.ohmyz.sh | sh
```
<br>
Ref : [Here](http://www.unixmen.com/install-oh-zsh-ubuntu-arch-linux-fedora/)

### 2.5 Solarzied Terminal
```
$ wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
$ mv dircolors.ansi-dark .dircolors

$ git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
$ cd gnome-terminal-colors-solarized
$ ./set_dark.sh

$ cp dotfiles/.zshrc ~/
```
<br>
Ref : [Here](http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html)

### 2.6 tmux, tmux-powerline
```
$ sudo apt-get install tmux
$ install tmux powerline see https://powerline.readthedocs.org/en/latest/installation/linux.html#installation-linux
$ cp dotfiles/.tmux.conf ~/
```


<br>
## 3. Key

### 3.1 Default Key Configuration
```
super + del -> gnome-system-monitor (Custom)
super + e -> Home Folder (in Launchers)
shift + alt + d -> hud (in Launchers)
right alt -> compose key (in Typing)
Use compose key as input source switcher (in Typing)
```

### 3.2 Capslock as ESC
```
$ sudo apt-get install gnome-tweak-tool
gnome-tweak-tool > Typing > Make Caps Lock an additional ESC
```

<br>
## 4. Korean
```
Language Supoort -> install Korean
Text Entry -> add Korean(Hangul) in Input source 
```
<br>
### 4.1 한글 짤림 문제 (Optional)
```
sudo add-apt-repository -y ppa:jincreator/freetype && sudo apt update && sudo apt install -y libfreetype6

```

<br>
## 5. Development Environment

### 5.1 Node.js

```
$ sudo add-apt-repository ppa:chris-lea/node.js
$ sudo apt-get update
$ sudo apt-get install python-software-properties python g++ make nodejs
$ sudo npm install -g bower supervisor grunt-cli karma karma-cli 
```

If you get permission error when run `npm install`, try this

```
$ sudo chown -R $USER:$USER ~/tmp
$ sudo chown -R $USER:$USER ~/.npm
```


### 5.2 MongoDB
```
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
$ echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
$ sudo apt-get update
$ sudo apt-get install mongodb-org
$ sudo service mongod start

$ # add admin user 
$ sudo vi /etc/mongodb.conf auth config
$ sudo service mongod restart
```

### 5.3 C++
```
$ sudo apt-get install gcc g++ make cmake autoconf libtool
```

### 5.4 Java 8
```
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
$ sudo apt-get install oracle-java8-set-default

$ # export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
$ # export JAVA_HOME=/usr/lib/jvm/java-8-oracle
$
```

### 5.5 Mysql 5.5
```
$ sudo apt-get install mysql
$ # install mysql workbench
```

### 5.6 Spring
```
$ # get STS 
$ tar -zxvf sts*
$ sudo mv sts-bundle /opt
$ cd /opt/sts-bundle/sts-3.5.1.RELEASE
$ sudo ln -s /opt/sts-bundle/sts-3.5.1.RELEASE/STS /usr/local/bin/sts

$ sudo vi /usr/share/applications/sts.desktop

[Desktop Entry]
Name=sts
Exec=/usr/local/bin/sts
Terminal=false
StartupNotify=true
Icon=/opt/eclipse/icon.xpm
Type=Application

$ # add extentions vrapper, color-theme, gradle support
$ # set emacs key binding as default key
```

### 5.7 PHP and Nginx

```
$ sudo apt-get install mysql-server php5-fpm php5-curl php5-mysql nginx
sudo usermod -a -G www-data $USER
sudo shutdown -r now
```

`/etc/php5/fpm/php.ini` setting should be

```
...
...
cgi.fix_pathinfo=0
...
...
```

and In `/etc/php5/fpm/pool.d/www.conf`, Uncomment all permission lines, like:

```
listen.owner = www-data
listen.group = www-data
listen.mode = 0660
```

Then restart php5-fpm

```
$ sudo service php5-fpm restart
```

### 5.8 Emacs

See : https://github.com/ansterd/emacs-linux/

### 5.9 Git

```
$ dotfiles/.gitconfig ~/
```

Ref1 : http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/  
Ref2 : http://oli.jp/2012/git-powerup/

### 5.10  vim

VIM Configuration using **vundle** as package management tool

#### Packages

- surround.vim
- matchit

### 5.11 Python

#### Virtualenv

```
sudo pip install virtualenv
sudo pip install virtualenvwrapper
```

#### Ipython

See http://blog.safaribooksonline.com/2013/12/12/start-ipython-notebook/

```
sudo pip install jinja2 tornado pyzmq
sudo pip install ipython[all] # in bash
```

#### Sublime 3 Todo

- jedi
- Ipython

### 5.12 Ruby

See https://gorails.com/setup/ubuntu/14.04

## 6. Ghost

Install `buster`

```
# ref : http://seoh.github.io/ghost-to-gh-pages/index.html

git clone https://github.com/seoh/buster.git && cd buster  
sudo python setup.py install  

```

Get `gen-sitemap.sh' to generate Ghost sitemap from [Here](https://gist.github.com/vbtechsupport/7094343)

Set `.zshrc`

```
alias busg='buster generate --domain=http://127.0.0.1:2368 --dir=~/Dropbox/Blog/1ambda.github.io' --base='http://1ambda.github.io'
alias busm='/home/anster/Dropbox/Blog/ghost-tools/gen-sitemap.sh'
alias busd='buster deploy --dir=~/Dropbox/Blog/1ambda.github.io'  
```

Install Ghost see [Velox](https://github.com/1ambda/velox)


