#!/bin/bash

pushd /root
case "$HADOOP_MAJOR_VERSION" in
  1)
    echo "Nothing to initialize for MapReduce in Hadoop 1"
    ;;
  2) 
    # wget http://s3.amazonaws.com/spark-related-packages/mr1-2.0.0-mr1-cdh4.2.0.tar.gz 
    wget http://s3.amazonaws.com/spark-related-packages/hadoop-2.4.0.tar.gz
    #tar -xvzf mr1-*.tar.gz > /tmp/spark-ec2_mapreduce.log
    tar -xvzf hadoop-*.tar.gz > /tmp/spark-ec2_hadoop.log
    #rm mr1-*.tar.gz
    rm hadoop-*.tar.gz
    mv hadoop-2.4.0/ mapreduce/
    ;;

  *)
     echo "ERROR: Unknown Hadoop version"
     return -1
esac
/root/spark-ec2/copy-dir /root/mapreduce
popd
