FROM dockerproject_javacont
MAINTAINER manclyon

## Make directory and download installation file
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
RUN wget http://mirror.vorboss.net/apache/tomcat/tomcat-8/v8.5.8/bin/apache-tomcat-8.5.8.tar.gz

## Extract the file
RUN tar xzvf apache-tomcat-8.5.8.tar.gz

## Create a user in called "tomcat" in group "tomcat" 
RUN useradd -s /sbin/nologin -d /opt/tomcat/temp tomcat

#Change the ownership to tomcat
RUN chown -R tomcat:tomcat apache-tomcat-8.5.8.tar.gz
RUN chmod -R 750 apache-tomcat-8.5.8

#Set the java home
RUN echo "export JAVA_HOME=/opt/jdk1.8.0_112" >> /etc/profile

#Start the service
WORKDIR usr/local/tomcat/apache-tomcat-8.5.8/bin
RUN chmod a+x startup.sh
RUN ./startup.sh
