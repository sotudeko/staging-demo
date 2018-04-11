#!/bin/bash

repo=$1

curl  -X GET --user admin:admin123 http://localhost:8081/service/rest/beta/components?repository=${repo}