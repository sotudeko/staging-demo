pipeline {
    agent any

    environment {
        DEV_REPO = 'staging-dev'
        TAG_FILE = './tag_file.json'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn -Dproject.version=$BUILD_VERSION -Dmaven.test.failure.ignore clean deploy'
            }
            post {
                success {
                    echo 'Now archiving...'
                    archiveArtifacts artifacts: "**/target/*.war"
                }
            }
        }

        stage('Nexus IQ Scan'){
            steps {
                nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'webgoat-example', iqStage: 'build', jobCredentialsId: ''
            }
        }   

        stage('Create Build Tag') {
            steps {
                sh './staging_generate_tag.sh $USER $JOB_NAME $BUILD_ID $BUILD_URL $BUILD_TAG $BUILD_VERSION > $TAG_FILE'
                sh 'curl -s -X POST -u admin:admin123 -H "Content-Type: application/json" -d @$TAG_FILE http://localhost:8081/service/rest/beta/tags'
                // sh 'curl -s -X POST -u admin:admin123 -H "Content-Type: application/json" -H "Accept: application/json" http://localhost:8081/service/rest/beta/tags/associate/${BUILD_TAG} -d repository=${DEV_REPO} -d maven.groupId=WebGoat -d maven.artifactId=WebGoat -d maven.baseVersion=${BUILD_VERSION}'
                sh 'curl -s -X POST -u admin:admin123 --header "Content-Type: application/json" --header "Accept: application/json" "http://localhost:8081/service/rest/beta/tags/associate/${BUILD_TAG}?repository=staging-dev&maven.groupId=WebGoat&maven.artifactId=WebGoat&maven.baseVersion=${BUILD_VERSION}"'
                sh 'curl  -X GET --user admin:admin123 "http://localhost:8081/service/rest/beta/search?repository=${${DEV_REPO}}&tag=${${BUILD_TAG}}"'
            }
        }

        // stage('Upload artifact to Staging Dev'){
        //     steps {
        //         sh './staging_info'
        //     }
        // }
    }
}


