# tools
# export PATH="$PATH:$HOME/tools/bin:$HOME/.svm/current/rt/bin"
# source $HOME/tools/k/k.sh
# source $HOME/.svm/svm.sh

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

## java
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

## applications bin
export APPLICATION_HOME=~/Applications
export PATH=$APPLICATION_HOME:$PATH

# haskell
export PATH=$HOME/.cabal/bin/:$PATH

# HADOOP

# export HADOOP_HOME=$HOME/github/apache/apache-hadoop/hadoop-3.7.3
# export PATH=$HADOOP_HOME/bin:$PATH
# export HIVE_HOME=$HOME/github/apache/apache-hive/apache-hive-2.1.1-bin
# export PATH=$HIVE_HOME/bin:$PATH
# export HBASE_HOME=$HOME/github/apache/apache-hbase/hbase-1.3.1
# export PATH=$HBASE_HOME/bin:$PATH
# export PHOENIX_HOME=$HOME/github/apache/apache-phoenix/apache-phoenix-4.10.0-HBase-1.2-bin
# export PATH=$PHONIEX_HOME/bin:$PATH
# export ZK_HOME=$HOME/github/apache/apache-zookeeper/zookeeper-3.4.10
# export PATH=$ZK_HOME/bin:$PATH
# export SPARK_HOME=$HOME/github/apache/apache-spark/spark-2.1.1-bin-hadoop2.7
# export PATH=$SPARK_HOME/bin:$PATH
# export PRESTO_HOME=$HOME/github/apache/facebook-presto
# export PATH=$PRESTO_HOME/bin:$PATH

# export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH
# export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
# export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
