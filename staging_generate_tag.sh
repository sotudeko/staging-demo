#!/bin/sh

echo '{'
echo " \"name\": \"$5\"," 
echo ' "attributes": { '
echo "    \"buildUser\": \"$1\"," 
echo "    \"buildJob\": \"$2\","
echo "    \"buildId\": \"$3\"," 
echo "    \"buildUrl\": \"$4\"" 
echo "    \"appVersion\": \"$6\"" 
echo '  }'
echo '}'


