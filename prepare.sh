#!/bin/sh

## Install pip etc.
apt install curl git python python-pip

## Install Docker:
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

## Install Docker-Compose
pip install -y docker-compose