FROM dockerproject_javacont
MAINTAINER manclyon

#method:http://www.ibm.com/support/knowledgecenter/SS4GSP_6.2.0/com.ibm.udeploy.install.doc/topics/server_install_silent.html


#Install unzipper 
RUN apt-get install -y unzip


# UrbanCode deploy trial version 
RUN wget https://www15.software.ibm.com/sdfdl/v2/fulfill/CNEM5EN/Xa.2/Xb.aFmQQe8PD7-rdHgdF8-_uP4fNAAiKCyKlKGBGxKACw8/Xc.CNEM5EN/URBANCODE_DEPLOY_6.2.2_EN_EVAL.zip/Xd./Xf.LPR.F1AZ/Xg.8911986/Xi.RATLe-UCDeploy-EVAL/XY.regsrvs/XZ.H9yzwpoBBD7wMwpmo-tfLDSe6to/URBANCODE_DEPLOY_6.2.2_EN_EVAL.zip
#Extract the zip file 
RUN unzip URBANCODE_DEPLOY_6.2.2_EN_EVAL.zip

#Install the dependencies (open jdk/jre and mysql)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server libmysql-java openjdk-8-jdk openjdk-8-jre

#Set java home
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

#Setup mysql - in a similar fashion to how it was done in zabbix dockerfile
RUN service mysql start\
&& mysql -u root -e "create user 'ibm-ucd'@'localhost' identified by 'password';"\
&& mysql -u root -e "create database uDeploy;"\
&& mysql -u root -e "grant all on uDeploy.* to 'ibm-ucd'@'localhost';"\
&& mysql -u root -e "grant all privileges on uDeploy.* to 'ibm-ucd'@'localhost' with grant option;"\
&& mysql -u root -e "flush privileges;"



#Need to include settings in the install properties file  --> will help to automate the install process (i.e answering the questions)
#File, ucd.install.properties, contains what is needed. Copy into container.
COPY ucd.install.properties /ibm-ucd-install/

#Go to install directory
WORKDIR /ibm-ucd-install/
#Put the settings into the install folder (install.properties)
RUN cat install.extra.properties >> install.properties &&\
sed -i '/chmod +x "opt\/apache-ant-\${OUR_ANT_VERSION}\/bin\/ant"/ s/$/; sync/' install-server.sh && \
chmod +x install-server.sh; sync

#Copy
RUN cp /usr/share/java/mysql.jar /ibm-ucd-install/lib/ext


#Start execute the install .sh file
RUN service mysql start &&\
./install-server.sh << EOF

# Start mysql and urbancode deploy server 
ENTRYPOINT service mysql start && /opt/ibm-ucd/server/bin/server run
