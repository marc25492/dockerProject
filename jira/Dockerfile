FROM dockerproject_javacont

#change directory
WORKDIR /opt/

#download Jira
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.4-x64.bin

# Allow the file to be executable
RUN chmod a+x atlassian-jira-software-7.2.4-x64.bin

RUN apt-get install git -y

#download varfile
RUN git clone https://github.com/SASM92/DockerProj1.git

#run
RUN ./atlassian-jira-software-7.2.4-x64.bin -q -varfile DockerProj1/files/response.varfile

#Change th working directory
WORKDIR /opt/atlassian/jira/bin
#Start!
CMD ./start-jira.sh && tail -F /var/lib/jira/error.log
