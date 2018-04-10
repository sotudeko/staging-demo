pipeline {
    agent any

    environment {
        DEV_REPO = 'staging-dev'
        TEST_REPO = 'staging-test'
        PROD_REPO = 'staging-prod'
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

        stage('Nexus IQ Scan'){
            steps {
                nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'webgoat-example', iqStage: 'build', jobCredentialsId: ''
            }
        }   

        stage('Create Build Tag') {
            steps {
                sh 'find . -print'
            }
        }
    }
}


