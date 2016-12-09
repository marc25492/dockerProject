FROM dockerproject_javacont
MAINTAINER manclyon

#Change work directory - to /opt
WORKDIR /opt

#Get Git
RUN apt-get install git -y

#Download jira from internet
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.9-x64.bin

#update system pre-install
RUN apt-get update -y

#Extract jira
RUN chmod a+x atlassian-jira-6.4.9-x64.bin


#Create varfile
RUN git clone https://github.com/marc25492/javaTest.git

#COPY VARFILE INTO OPT
RUN cp javaTest/response.varfile response.varfile


#Execute Bin file
RUN ./atlassian-jira-6.4.9-x64.bin -q varfile /opt/response.varfile


#Make Jira directory
RUN mkdir /var/jira


#Set home 
RUN export JIRA_HOME=/var/jira



#Start Jira
WORKDIR /opt/JIRA/bin
ENTRYPOINT ./start-jira.sh && bash



