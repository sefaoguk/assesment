#!/bin/bash


echo 'PUSHIN MAIN'
# Docker Imajını dockerhuba pushlanır.
docker push main-project:${BRANCH_NAME}_${BUILD_ID}
# Yer kaplamaması için mevcut image sunucudan silinir.
docker rmi main-project:${BRANCH_NAME}_${BUILD_ID}

echo 'PUSHED MAIN'