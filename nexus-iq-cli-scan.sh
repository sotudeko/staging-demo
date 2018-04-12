#!/bin/bash

java -jar /opt/nexus-iq/nexus-iq-cli -i webgoat-example -s http://localhost:8070 -a admin:admin123 ./target/WebGoat-5.4.4.3-SNAPSHOT.war -r ./scan.json
