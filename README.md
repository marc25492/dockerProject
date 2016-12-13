# How-To:


-Step 1: Download/Install Docker and Git

-Step 2: Download (clone) my git repository: https://github.com/marc25492/dockerProject

-Step 3: install Docker-compose:

  -Step 3a: curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o   /usr/local/bin/docker-compose
  
  -Step 3b: chmod +x /usr/local/bin/docker-compose
  
  -Step 3c: docker-compose --version (as a check that it is installed)

-Step 4: change directory to /dockerProject

-Step 5: docker-compose up -d


# To access the web-apps:

- Jira: IpAddress:8056
- Nexus: IpAddress:8081
- Jenkins: IpAddress:8080
- Zabbix: IpAddress/zabbix
- Tomcat: IpAddress:8087


