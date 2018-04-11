#!/bin/bash

repo=$1
tag=$2

curl  -X GET --user admin:admin123 http://localhost:8081/service/rest/beta/search?repository=${repo}&tag=${tag}

