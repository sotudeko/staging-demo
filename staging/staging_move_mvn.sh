#!/bin/bash

src_repo=$1
dest_repo=$2
tag=$3

#  curl -i -X POST --user admin:admin123 "http://localhost:8081/service/rest/beta/staging/move/${dest_repo}?repository=${src_repo}&tag=${tag}&name=WebGoat&group=org.sample&version=5.4.4.3"

echo curl -i -X POST --user admin:admin123 http://localhost:8081/service/rest/beta/staging/move/${dest_repo}?tag=${tag}