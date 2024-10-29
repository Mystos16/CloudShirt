#!/bin/bash
git pull
docker-compose build
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 093215643118.dkr.ecr.us-east-1.amazonaws.com
docker-compose push
docker stack deploy -c docker-compose.yml eshop-stack
