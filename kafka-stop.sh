#!/bin/bash

###                    ###
### stop kafka service ###
###                    ###

echo checking kafka status.
sleep 1
PIDS=`/usr/ucb/ps -awwwx | grep kafka.Kafka | grep -v grep  | /usr/bin/nawk -F" " '{print $1}'`
            if [ -z "$PIDS" ]; then
            echo -e "\e[33m`date` : kafka is not running.\e[m"
            sleep 1
            else
            kill -9 $PIDS
            echo "killing kafka by $PIDS pid"
            sleep 1
            PIDS=`/usr/ucb/ps -awwwx | grep java | grep kafka.Kafka | grep -v grep  | /usr/bin/nawk -F" " '{print $1}'`
                        if [ -z "$PIDS" ]; then
                        echo -e "\e[32m`date` : kafka was killed successfully.\e[m"
                        sleep 1 
                        else
                        echo -e "\e[31m`date` : killing process was not successful.\e[m"
                        sleep 1
                        fi
            fi

###                        ###
### stop zookeeper service ###
###                        ###

echo 
echo "******"
echo
echo checking zookeeper status.
sleep 1
PIDS=`/usr/ucb/ps -awwwx | grep org.apache.zookeeper.server.quorum.QuorumPeerMain | grep -v grep  | /usr/bin/nawk -F" " '{print $1}'`
            if [ -z "$PIDS" ]; then
            echo -e "\e[33m`date` : zookeeper is not running.\e[m"
            sleep 1
            else 
            echo killing zookeeper by $PIDS pid. 
            sleep 1
            kill -9 $PIDS

echo -ne '####                      (25%)\r'
sleep 1
echo -ne '########                  (50%)\r'
sleep 1
echo -ne '############              (75%)\r'
sleep 1
echo -ne '################          (100%)\r'
echo -ne '\n'
sleep 1

            echo verifying the killing process.
            sleep 1
            PIDS=`/usr/ucb/ps -awwwx | grep -i org.apache.zookeeper.server.quorum.QuorumPeerMain | grep -v grep  | /usr/bin/nawk -F" " '{print $1}'`
                        if [ -z "$PIDS" ]; then
                        echo -e "\e[32m`date` : zookeeper was killed successfully.\e[m"
                        sleep 1
                        else
                        echo -e "\e[31`date` : killing process was not successful.\e[m"
                        sleep 1
                        fi
            fi
