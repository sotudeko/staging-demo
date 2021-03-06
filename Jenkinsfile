pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn -B -Dproject.version=$BUILD_VERSION -Dmaven.test.failure.ignore clean deploy'
      }
      post {
        success {
          echo 'Now archiving...'
          archiveArtifacts '**/target/*.war'

        }

      }
    }
    stage('Nexus IQ Scan') {
      steps {
        sh 'java -jar /opt/nexus-iq/nexus-iq-cli -i webgoat-example -s http://localhost:8070 -a admin:admin123 ./target/WebGoat-${BUILD_VERSION}.war -r ./scan.json'
      }
    }
    stage('Tag Build') {
      steps {
        sh './staging_generate_tag.sh $USER $JOB_NAME $BUILD_ID $BUILD_URL $BUILD_TAG $BUILD_VERSION > $TAG_FILE'
        sh 'curl -s -X POST -u admin:admin123 -H "Content-Type: application/json" -d @$TAG_FILE http://localhost:8081/service/rest/beta/tags'
        sh 'curl -s -X POST -u admin:admin123 --header "Content-Type: application/json" --header "Accept: application/json" "http://localhost:8081/service/rest/beta/tags/associate/${BUILD_TAG}?repository=staging-dev&maven.groupId=WebGoat&maven.artifactId=WebGoat&maven.baseVersion=${BUILD_VERSION}"'
        sh 'curl -s -X GET -u admin:admin123 "http://localhost:8081/service/rest/beta/search?repository=${DEV_REPO}&tag=${BUILD_TAG}"'
      }
    }
    stage('Read File') {
      steps {
        readFile 'tag.json'
        echo 'Finishing'
      }
    }
  }
  environment {
    DEV_REPO = 'staging-dev'
    TAG_FILE = './tag_file.json'
    SCAN_FILE = './target/WebGoat-5.4.4.3-SNAPSHOT.war'
  }
}