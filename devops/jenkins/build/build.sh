#!/bin/bash

cd main

echo 'MAIN BUILDING'
# Maın klasörünün içerisinde girerek Dockerfile sayesinde build alınmasını sağlar.
docker build -t geoanka/assesment-devops:${BRANCH_NAME}_${BUILD_ID}
echo 'MAIN BUILDED'