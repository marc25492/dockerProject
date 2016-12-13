FROM dockerproject_javacont
MAINTAINER manclyon

#create group called tomcat
RUN groupadd tomcat

#create new tomcat user, which no one can log in to and a home directory of Tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/apache-tomcat-8.5.8 tomcat

#Change working directory
WORKDIR /opt

#download Tomcat
RUN wget http://apache.mirrors.nublue.co.uk/tomcat/tomcat-8/v8.5.8/bin/apache-tomcat-8.5.8.tar.gz
#Extract file
RUN tar -xzvf apache-tomcat-8.5.8.tar.gz

#update permissions
RUN chgrp -R tomcat /opt/apache-tomcat-8.5.8 #R flag gives ownership over entire directory
RUN chmod -R g+rx apache-tomcat-8.5.8 #gives read and execute access to folder

#Update Java home
RUN echo "export JAVA_HOME=/opt/java/jdk1.8.0_05" >> /etc/profile

#Change Working directory
WORKDIR /opt/apache-tomcat-8.5.8/bin/
#Change the permissions: now file can be executed
RUN chmod a+x startup.sh
#Run!
ENTRYPOINT ./startup.sh && bash
