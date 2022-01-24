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

RUN rm kafka-3.0.0-src.tgz

####################################################################
# Go
####################################################################
RUN apt-get install -y \
    golang-go 
