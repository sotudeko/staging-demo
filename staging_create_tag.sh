#!/bin/bash

curl -X POST -u admin:admin123 -H 'Content-Type: application/json' -d @${1} http://localhost:8081/service/rest/beta/tags

 