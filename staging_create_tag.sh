#!/bin/bash

ruser=admin
rpwd=admin123

curl  -i -X POST —user "$ruser:$rpwd" —header ‘Content-Type: application/json’ \
-d @${1} \
'http://localhost:8081/service/rest/beta/tags'


