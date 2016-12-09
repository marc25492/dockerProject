FROM dockerproject_javacont
MAINTAINER manclyon

#change directory
WORKDIR /opt/

#### Download and install LAMP stack ####
RUN apt-get update

#Get and install apache
RUN apt-get install apache2 -y


# Automate the mysql process by pre-setting password
RUN echo 'mysql-server mysql-server/root_password password 123' | debconf-set-selections 
RUN echo 'mysql-server mysql-server/root_password_again password 123' | debconf-set-selections
#Get and install mysql - automate with '-y' 
RUN apt-get install mysql-server -y 


# Get all of the PHP files which are required by zabbix
RUN apt-get install php7.0 php7.0-cli php7.0-common php7.0-mysql libapache2-mod-php7.0 php7.0-cgi php7.0-xmlreader php7.0-xmlwriter php7.0-bcmath php7.0-mbstring -y
#change the timezone setting
RUN sed -i 's/\;date\.timezone\ =/date.timezone\ =\ UTC/' /etc/php/7.0/apache2/php.ini



#### Get and configure Zabbix ####

#Download
RUN wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb
#Extract
RUN dpkg -i zabbix-release_3.2-1+xenial_all.deb
#Update system
RUN apt-get update

# Install zabbix components
RUN apt-get install -q zabbix-server-mysql zabbix-frontend-php -y

#Configure mysql - use &&'s to run all at once (mysql normally closes after each command)
RUN service mysql start \
&& mysql -u root -p123 -e "CREATE USER 'zabbix';"\
&& mysql -u root -p123 -e "CREATE DATABASE zabbixdb;"\
&& mysql -u root -p123 -e "GRANT ALL on zabbixdb.* to zabbix@localhost IDENTIFIED BY '123';"\
&& mysql -u root -p123 -e "FLUSH PRIVILEGES;"

#Move to zabbix-server-mysql folder
WORKDIR /usr/share/doc/zabbix-server-mysql
RUN service mysql start \
&& zcat create.sql.gz | mysql zabbixdb -u zabbix -p123


# Change settings in the configuration folder - use sed command
RUN sed -i '/# DBHost=/c\DBHost=localhost' /etc/zabbix/zabbix_server.conf
RUN sed -i '/DBName=/c\DBName=zabbixdb' /etc/zabbix/zabbix_server.conf
RUN sed -i '/# DBPassword=/c\DBPassword=123' /etc/zabbix/zabbix_server.conf
RUN sed -i '/# DBPort=/c\DBPort=3306' /etc/zabbix/zabbix_server.conf


# Restart zabbix and apache
RUN service apache2 restart && service zabbix-server restart

# Run everything on entry + bash to keep the container open
ENTRYPOINT service apache2 start && service mysql start && service zabbix-server start && bash
