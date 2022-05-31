#!/bin/bash


# Sunucunun içerisindeki deploymentın imajını güncellemek terraform gibi altyapı olmadığı için aşağıdaki şekilde yöntem uygulanmıştır..
echo "MAIN UPDATING"
kubectl set image deployment/assesment geoanka/assesment-devops:${BRANCH_NAME}_${BUILD_ID} --record
echo "MAIN UPDATED"