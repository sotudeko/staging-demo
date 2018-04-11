pipeline {
    agent any

    environment {
        DEV_REPO = 'staging-dev'
        TAG_FILE = './tag_file.json'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn -Dproject.version=$BUILD_VERSION -Dmaven.test.failure.ignore clean package'
            }
            post {
                success {
                    echo 'Now archiving...'
                    archiveArtifacts artifacts: "**/target/*.war"
                }
            }
        }

        // stage('Nexus IQ Scan'){
        //     steps {
        //         nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'webgoat-example', iqStage: 'build', jobCredentialsId: ''
        //     }
        // }   

        stage('Create Build Tag') {
            steps {
                sh '''
                    echo { \"name\": \"$BUILD_TAG\", \"attributes\": { \"buildUser\": \"$USER\", \"buildJob\": \"$JOB_NAME\", \"buildId\": \"BUILD_ID\", \"buildUrl\": \"$BUILD_URL\" } } > $TAG_FILE
                '''
                // sh './staging_generate_tag.sh $USER $JOB_NAME $BUILD_ID $BUILD_URL $BUILD_TAG > $TAG_FILE'
                sh 'cat $TAG_FILE'
                // sh 'curl -s -X POST -u admin:admin123 -H "Content-Type: application/json" -d @$TAG_FILE http://localhost:8081/service/rest/beta/tags'
            }
        }

        // stage('Upload artifact to Staging Dev'){
        //     steps {
        //         sh './staging_info'
        //     }
        // }
    }
}


