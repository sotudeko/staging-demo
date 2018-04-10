#!/bin/sh

echo '{'
echo ' “name”:"my-tag”,' 
echo ' “attributes”: { '
echo "    \"buildUser\": \"$1\"," 
echo "    \"buildNumber\": \"$2\","
echo '  }'
echo '}'
