#!/bin/sh

scan_url=$(cat ./scan.json | grep reportHtmlUrl | cut -f2- -d":" | tr -d ", \"")

echo '{'
echo " \"name\": \"$5\"," 
echo ' "attributes": { '
echo "    \"buildUser\": \"$1\"," 
echo "    \"buildJob\": \"$2\","
echo "    \"buildId\": \"$3\"," 
echo "    \"appVersion\": \"$6\""
echo "    \"buildUrl\": \"$4\"," 
echo "    \"iqScanReportUrl\": \"$scan_url\"" 
echo '  }'
echo '}'


