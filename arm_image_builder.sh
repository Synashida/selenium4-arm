#!/bin/sh

# Base
docker-compose -f docker-compose-arm-image-build.yml build --no-cache selenium-base
docker tag docker-selenium_selenium-base:latest ncnetwork/selenium4-base-arm:latest
docker push ncnetwork/selenium4-base-arm:latest

# HUB
docker-compose -f docker-compose-arm-image-build.yml build --no-cache selenium-hub
docker tag docker-selenium_selenium-hub:latest ncnetwork/selenium4-hub-arm:latest
docker push ncnetwork/selenium4-hub-arm:latest

# Node Base
docker-compose -f docker-compose-arm-image-build.yml build --no-cache selenium-node-base
docker tag docker-selenium_selenium-node-base:latest ncnetwork/selenium4-node-base-arm:latest
docker push ncnetwork/selenium4-node-base-arm:latest

# Node Chrome
docker-compose -f docker-compose-arm-image-build.yml build --no-cache selenium-node-chrome
docker tag docker-selenium_selenium-node-chrome:latest ncnetwork/selenium4-node-chrome-arm:latest
docker push ncnetwork/selenium4-node-chrome-arm:latest

# Node Firefox
docker-compose -f docker-compose-arm-image-build.yml build --no-cache selenium-node-firefox
docker tag docker-selenium_selenium-node-firefox:latest ncnetwork/selenium4-node-firefox-arm:latest
docker push ncnetwork/selenium4-node-firefox-arm:latest

# Node Edge
#docker-compose -f docker-compose-arm-image-build.yml build --no-cache selenium-node-edge
#docker tag docker-selenium_selenium-node-edge:latest ncnetwork/selenium4-node-edge-arm:latest
#docker push ncnetwork/selenium4-node-edge-arm:latest
