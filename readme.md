# Overview
This version targets a direct nodeJS script rather than with a process manager. It avoids the ram usage overhead added by PM2 manager. Also it's a direct script without any API just for examples purpose. 

Assuming we are going to use digitalocean for hosting, we will install a one click app, it should be either Docker or NodeJS. That way we don't have to worry about installing them manually. 

Make sure you have docker installed and running, after that, we have a docker file `Dockerfile` which we can use to deploy our app anywhere. The docker file is commented out with proper code, you can read it to know what is happenening behind the scene. 

This is a very big topic to cover, so I'll link to related resources instead to discuss everything here, If you don't know what is docker or nodejs, 

Here are some crash courses that will make you up and running,
- https://www.youtube.com/watch?v=YFl2mCHdv24

Here are some videos about deploying an app on digitalocean,
- https://www.youtube.com/watch?v=BUasdmczmMw
- https://www.youtube.com/watch?v=RE2PLyFqCzE

If you want to know how to install docker or nodejs manually, here are some guides for that,
- Install Docker manually, https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
- Install NodeJS manually, https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions

# Preparation

So the instructions right now are pretty straightforward,
- Clone the repo, or upload it to server.
- Run `Dockerfile` which will do the rest of the work.

## Running the docker

You need to build the docker image/container every time you want to run the script, Make sure to remove the container before building another one. I cannot go over all commands, but here are some basic commands to get you going.

```sh
# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# build the docker and give it a name
docker build -t myapp . 
```

Now that we built it, we can run it various ways, make sure to run only one of the following commands,

```sh
# start the container, expose to network and restart on fail, 
# if you exit terminal, it will run on background
docker run --network=host --restart always -it myapp

# start the container, expose to network and remove on successful run, 
# also if you exit terminal, it will stop and remove container
docker run --network=host --rm -it myapp

# starts the container, expose to network
# runs on background as daemon, won't show anything on terminal
docker run --network=host --restart always -d myapp
```
