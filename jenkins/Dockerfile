FROM dockerProject_javaFile
MAINTAINER manclyon

#Get key
RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -

#Update sources
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

#Update system pre-instal
RUN apt-get update -y

#Install using apt-get (because I can't find a wget online!)
RUN apt-get install jenkins -y


#Open jenkins and keep open and output things
CMD service jenkins start && tail -F /var/log/jenkins/jenkins.log

#Output password
CMD cat> /var/lib/jenkins/secrets/initialAdminPassword 
