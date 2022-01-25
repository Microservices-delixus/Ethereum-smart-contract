FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive 
ARG golang-go 

RUN apt-get -y update
RUN apt-get install openjdk-8-jdk
RUN apt-get install -y \
    wget \
    unzip \   
    vim \
    openjdk-8-jdk
    
	
####################################################################
# Kafka
####################################################################

RUN mkdir kafka

WORKDIR /kafka
RUN wget https://dlcdn.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz

RUN tar zxvf kafka_2.13-3.0.0.tgz

RUN rm kafka_2.13-3.0.0.tgz

RUN cd kafka/kafka_2.13-3.0.0
RUN cd kafka/kafka__2.13-3.0.0/pwd

//set path on log dir
RUN vi server.properties
RUN vi zookeeper.properties

cd kafka/kafka_2.13-3.0.0
RUN bin/zookeeper-server-start.sh config/zookeeper.properties 

//NEXT TERMINAL
cd kafka/kafka_2.13-3.0.0
RUN bin/kafka-server-start.sh config/server.properties

// NEXT TERMINAL
cd kafka/kafka_2.13-3.0.0
RUN bin/kafka-console-producer.sh --broker-list localhost:9092 --topic HDFS-TOPIC

//NEXT TERMINAL
RUN bin/kafka-console-consumer.sh --bootstrap-server  localhost:9092 --topic HDFS-TOPIC --from-beginning

####################################################################
# Go
####################################################################
RUN apt-get install -y \
    golang-go 
