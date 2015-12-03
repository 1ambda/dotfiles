
## pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

## java
# export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA6_HOME=/Library/Java/JavaVirtualMachines/1.6.0_65-b14-462.jdk/Contents/Home
JAVA_HOME=$JAVA7_HOME


## scala
export SCALA_HOME=~/Applications/scala
export PATH=$SCALA_HOME/bin:$PATH
export ACTIVATOR_HOME=~/Applications/activator
export PATH=$ACTIVATOR_HOME:$PATH

## applications bin
export APPLICATION_HOME=~/Applications
export PATH=$APPLICATION_HOME:$PATH

## nvm
export NVM_DIR="/Users/1002471/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## hadoop
export HADOOP_HOME="/usr/local/Cellar/hadoop/2.6.0"
export PATH=$HADOOP_HOME:$PATH
export HIVE_HOME=/usr/local/Cellar/hive/1.0.0/libexec
export PATH=$HIVE_HOME:$PATH
export HCAT_HOME=/usr/local/Cellar/hive/1.0.0/libexec/hcatalog
export PATH=$HCAT_HOME:$PATH

## dex2jar
export DEX2JAR_HOME="/Users/1002471/Applications/dex2jar"
export PATH=$DEX2JAR_HOME:$PATH

# haskell
export PATH=~/.cabal/bin/:$PATH
