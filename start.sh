#!/bin/sh

NAME='scraper2'

# build the docker
sudo docker build -t $NAME . 

# NOTE: UNCOMMENT ONLY OF OF THE FOLLOWING

# start the container, expose to network and restart on fail, 
# if you exit terminal, it will run on background
#docker run --network=host --restart always -it $NAME

# start the container, expose to network and remove on successful run, 
# also if you exit terminal, it will stop and remove container
docker run --network=host --rm -it $NAME

# starts the container, expose to network
# runs on background as daemon, won't show anything on terminal
#docker run --network=host --restart always -d $NAME