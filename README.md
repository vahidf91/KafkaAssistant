# KafkaAssistant
These Two useful scripts are written to stop and start Apache Kafka. In order to start Apache Kafka server you must start ZooKeeper service first. 

Both of start and stop scripts for Kafka and ZooKeeper are placed under `$KAFKA_HOME/bin` directory but stopping and starting these two service continuously can sometimes be a pain in the neck. So I wrote this script and added a verifying process to make sure these two services are started and stopped successfully.
