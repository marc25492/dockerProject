# How-To:


-Step 1: Download (clone) my git repository: https://github.com/marc25492/dockerProject

-Step 2: install Docker-compose:

  -Step 2a: curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o   /usr/local/bin/docker-compose
  
  -Step 2b: chmod +x /usr/local/bin/docker-compose
  
  -Step 2c: docker-compose --version (as a check that it is installed)

-Step 3: change directory to /dockerProject

-Step 4: docker-compose up -d
