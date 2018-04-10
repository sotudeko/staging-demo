#!/bin/sh

echo '{'
echo ' “name”:"my-tag”,' 
echo ' “attributes”: { '
echo "    \"buildTag\": \"$1\"," 
echo '  }'
echo '}'
