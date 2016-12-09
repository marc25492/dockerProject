FROM ubuntu:latest
MAINTAINER manclyon


# Update the running system
RUN apt-get update -y

# Install the (probably) necessary packages
RUN apt-get install -y wget
RUN apt-get install -y tar

#Move into the /opt directory
WORKDIR /opt


# download java tar file into container
RUN  wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz


# Extract file 
RUN tar zxvf jdk-8u112-linux-x64.tar.gz


#access the tmp/shared folder (where java.tar.gz lives) and copy across..
#ADD jdk-8u112-linux-x64.tar.gz /opt
#ADD apache-maven-3.2.5-bin.tar.gz /opt

#Install Java
RUN update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_112/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_112/bin/javac 100


#Install Maven
#RUN update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.2.5/bin/mvn 100
