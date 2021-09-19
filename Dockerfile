# Base image
#FROM python:3 
FROM ubuntu:20.04

# Set a directory for the app
#WORKDIR /home/ksatola

# Copy all the files to the container
COPY . .

# Install dependencies
RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	#&& apt-get -o Dpkg::Options::="--force-confold" upgrade -q -y --force-yes \ # this can break dependencies
    && apt-get -o Dpkg::Options::="--force-confold" dist-upgrade -q -y --force-yes \
	#&& apt-get -y install --no-install-recommends build-essential ruby-full \
	&& apt-get -qq -y install curl
    
# Locales
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
