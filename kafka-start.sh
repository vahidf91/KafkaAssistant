#!/bin/bash
#This script is written to start KAFKA.

###                                          ###
### First we have to start ZooKeeper service ###
###                                          ###

echo checking zookeeper status.
sleep 1
PIDS=`/usr/ucb/ps -awwwx | grep -v "grep" | grep org.apache.zookeeper.server.quorum.QuorumPeerMain | /usr/bin/nawk -F" " '{print $1}'`
            if [ -z "$PIDS" ]; then
            echo "zookeeper is not running. I'm going to start it."
            sleep 1
           $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties >/dev/null 2>&1 &
            echo verifying start process. 
            sleep 1 
            PIDS=`/usr/ucb/ps -awwwx | grep -v "grep" | grep org.apache.zookeeper.server.quorum.QuorumPeerMain | /usr/bin/nawk -F" " '{print $1}'`
                         if [ -n "$PIDS" ]; then
                         echo -e "\e[32m`date`: zookeeper started successfully.\e[m"
                         sleep 1
                         else
                         echo -e "\e[31m`date`: the start process was not successful.\e[m"
                         sleep 1
                         fi
            else
            echo -e "\e[33m`date`: zookeeper service is already running.\e[m"
            sleep 1
            fi

###                                        ###
### Second we have to start Kafka Service. ###
###                                        ###

echo
echo "******" 
echo
echo checking kafka status.
sleep 1
PIDS=`/usr/ucb/ps -awwwx | grep -v "grep" | grep kafka.Kafka  | /usr/bin/nawk -F" " '{print $1}'`
            if [ -z "$PIDS" ]; then
            echo "kafka is not running. I'm going to start it."
            sleep 1
            echo -ne '####                      (25%)\r'
            sleep 1
            echo -ne '########                  (50%)\r'
            sleep 1
            echo -ne '############              (75%)\r'
            sleep 1
            echo -ne '################          (100%)\r'
            echo -ne '\n'
           $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties >/dev/null 2>&1 &
            echo verifying start process.
            sleep 1
            PIDS=`/usr/ucb/ps -awwwx | grep -v "grep" | grep kafka.Kafka | /usr/bin/nawk -F" " '{print $1}'`
                         if [ -n "$PIDS" ]; then
                         echo -e "\e[32m`date`: kafka started successfully.\e[m"
                         sleep 1
                         else
                         echo -e "\e[31m`date`: the start process was not successful.\e[m"
                         sleep 1
                         fi
            else
            echo -e "\e[33m`date`: kafka service is already running.\e[m"
            sleep 1
            fi
