#!/bin/bash

ruser=admin
rpwd=admin123
repo_dir=$1
tag=$2
artifact=$3
repo_file=$4
repo=$5

# curl -X POST -u admin:admin123 --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' \
# -F maven2.groupId=WebGoat \
# -F maven2.artifactId=WebGoat \
# -F maven2.version=5.4.4.3-SNAPSHOT \
# -F maven2.generate-pom=true \
# -F maven2.packaging=war \
# -F maven2.asset1=WebGoat-5.4.4.3-SNAPSHOT.war \
# -F maven2.asset1.tag=jenkins-WebGoat-Example-Staging-Demo-18 \
# 'http://localhost:8081/service/rest/beta/components?repository=staging-demo'

# curl -i -X POST -u admin:admin123 -H 'Content-Type: multipart/form-data' -H 'Accept: application/json' -F maven2.groupId=WebGoat -F maven2.artifactId=WebGoat -F maven2.version=5.4.4.3-SNAPSHOT -F maven2.generate-pom=true -F maven2.packaging=war -F maven2.asset1=WebGoat-5.4.4.3-SNAPSHOT.war -F maven2.asset1.classifier=1.0 -F maven2.asset1.extension=war  'http://localhost:8081/service/rest/beta/components?repository=staging-demo'

# curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' -F maven2.groupId=WebGoat -F maven2.artifactId=WebGoat -F maven2.version=5.4.4.3-SNAPSHOT -F maven2.generate-pom=true -F maven2.packaging=war -F maven2.asset1.classifier=class -F maven2.asset1.extension=war -F  -F  -F  -F  -F  -F  -F  -F   'http://localhost:8081/service/rest/beta/components?repository=staging-demo'

# curl -i -u admin:admin123 -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' -F maven2.groupId=WebGoat -F maven2.artifactId=WebGoat -F maven2.version=5.4.4.3-SNAPSHOT -F maven2.generate-pom=true -F maven2.packaging=war -F maven2.asset1.tag=jenkins-WebGoat-Example-Staging-Demo-18 -F maven2.asset1.extension=war  'http://localhost:8081/service/rest/beta/components?repository=staging-demo'

# curl -i -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json'  -F maven2.asset1=WebGoat-5.4.4.3-SNAPSHOT.war -F maven2.groupId=org.demo -F maven2.artifactId=WebGoat -F maven2.version=5.4.4.3-SNAPSHOT -F maven2.generate-pom=true -F maven2.packaging=war -F maven2.tag=jenkins-WebGoat-Example-Staging-Demo-19   'http://localhost:8081/service/rest/beta/components?repository=staging-test'

# curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' 
-F maven2.asset1=WebGoat-5.4.4.3.war 
-F maven2.groupId=org.demo 
-F maven2.artifactId=WebGoat 
-F maven2.version=5.4.4.3 
-F maven2.generate-pom=true 
-F maven2.packaging=war 
-F maven2.tag=jenkins-WebGoat-Example-Staging-Demo-18  http://localhost:8081/service/rest/beta/components?repository=staging-test
