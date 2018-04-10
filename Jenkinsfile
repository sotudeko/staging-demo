pipeline {
    agent any

    environment {
        DEV_REPO = 'staging-dev'
        TEST_REPO = 'staging-test'
        PROD_REPO = 'staging-prod'
        ARTIFACT = './target/WebGoat-5.4.4.3-SNAPSHOT.war'
        TAG_FILE = './tag_file.json'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore clean package'
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
                    echo "{\“name\”:\"my-tag\”, \“attributes\”:{\"" > $TAG_FILE
                    echo "\"buildTag\": \"$BUILD_TAG\"" >> $TAG_FILE
                    echo "}}" >> $TAG_FILE
                '''
                sh 'cat $TAG_FILE'
            }
        }
    }
}


