#!/bin/bash

tag=$1
ver=$2

#curl -s -X POST -u admin:admin123 -H 'Content-Type: application/json' -H 'Accept: application/json' 'http://localhost:8081/service/rest/beta/tags/associate/jenkins-WebGoat-Example-Staging-Demo-31?repository=mvn-releases&maven.groupId=WebGoat&maven.baseVersion=5.5.16&maven.artifactId=WebGoat'

#echo "curl -s -X POST -u admin:admin123 -H 'Content-Type: application/json' -H 'Accept: application/json' http://localhost:8081/service/rest/beta/tags/associate/${tag}?repository=mvn-releases&maven.groupId=WebGoat&maven.baseVersion=${ver}&maven.artifactId=WebGoat"

curl -s -X POST -u admin:admin123 -H 'Content-Type: application/json' -H 'Accept: application/json' \
http://localhost:8081/service/rest/beta/tags/associate/${tag}? \
-d repository=mvn-releases \
-d maven.groupId=WebGoat \
-d maven.baseVersion=${ver} \
-d maven.artifactId=WebGoat
