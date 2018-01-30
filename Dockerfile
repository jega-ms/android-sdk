FROM ubuntu:16.04

MAINTAINER Jegadeesan M "jega4u@gmail.com"


# Install java8
# RUN apt-get update && apt-get install -y software-properties-common && \
#     add-apt-repository -y ppa:webupd8team/java && apt-get update
# RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# RUN apt-get install -y oracle-java8-installer

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
# AUTO Install 
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer
RUN apt-get install oracle-java8-set-default
RUN which java 

RUN apt-get install unzip

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.zip \
    --quiet https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \
    unzip android-sdk.zip -d android-sdk-linux  && rm -f android-sdk.zip && \
    chown -R root.root android-sdk-linux
    
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin      



RUN ls -lart /opt/android-sdk-linux/tools 

RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-27"

# Cleaning
# TODO reduce the image size , need to uninstall old sdk 
#RUN sdkmanager "platform-tools" "platforms;android-26"
RUN apt-get -y purge --auto-remove unzip 
RUN apt-get clean

