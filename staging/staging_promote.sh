#!/bin/bash

src_repo=$1
dest_repo=$2
tag=$3

echo curl  -i -X POST —u admin:admin123 -H 'Content-Type: application/json' -H 'Accept: application/json' "http://localhost:8081/service/rest/beta/staging/move/${dest_repo}?repository=${src_repo}&tag=${tag}&maven.groupId=org.demo&maven.artifactId=WebGoat&maven.baseVersion=5.4.4.3&maven.extension=war&tag=jenkins-WebGoat-Example-Staging-Demo-19"
curl -i -X POST —u admin:admin123 -H "Content-Type: application/json" -H "Accept: application/json" http://localhost:8081/service/rest/beta/staging/move/staging-test4?repository=staging-test-2&tag=jenkins-WebGoat-Example-Staging-Demo-19&maven.groupId=org.demo&maven.artifactId=WebGoat&maven.baseVersion=5.4.4.3&maven.extension=war


