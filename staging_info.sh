#!/bin/bash

ruser=admin
rpwd=admin123

repo=$1
tag=$2

curl -i -X GET —user "${ruser}:${rpwd}" http://localhost:8081/service/rest/beta/tags
curl -i -X GET —user "${ruser}:${rpwd}" http://localhost:8081/service/rest/beta/search?repository=${repo}&tag=${tag}
