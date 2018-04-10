#!/bin/bash

ruser=admin
rpwd=admin123
repo_dir=$1
tag=$2
artifact=$3
repo_file=$4
repo=$5

curl -i -X POST —user "$ruser:$rpwd" —header ‘Content-Type: multipart/form-data’ \
-F raw.directory=/${repo_dir} \
-F raw.tag=${tag} \
-F raw.asset1=@${artifact} \
-F raw.asset1.filename=${repo_file} \
http://localhost:8081/service/rest/beta/components?repository=${repo}

