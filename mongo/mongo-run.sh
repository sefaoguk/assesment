#!/bin/bash
docker run -d -p 2717:27017 -v $PWD/database:/data/db --name mongo mongo:latest

