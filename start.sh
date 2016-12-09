sudo docker build -t jenkinscont .
sudo docker run -dti -p 8080:8080 jenkinscont bash

