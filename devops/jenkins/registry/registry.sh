#!/bin/bash


echo 'PUSHIN MAIN'
# Docker Imajını dockerhuba pushlanır.
docker push geoanka/assesment-devops:${BRANCH_NAME}_${BUILD_ID}
# Yer kaplamaması için mevcut image sunucudan silinir.
docker rmi geoanka/assesment-devops:${BRANCH_NAME}_${BUILD_ID}

echo 'PUSHED MAIN'