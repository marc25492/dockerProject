FROM dockerProject_javacont
MAINTAINER manclyon

RUN apt-get update -y

#Change work directory - to /usr/local
WORKDIR /opt



#Download nexus from internet
RUN wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz

#Extract Nexus
RUN tar -zxvf latest-unix.tar.gz


ENTRYPOINT ./nexus-3.1.0-04/bin/nexus start && bash

