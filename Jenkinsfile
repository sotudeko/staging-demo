pipeline {
    agent any

    environment {
        DEV_REPO = 'staging-demo'
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
                sh './staging_generate_tag.sh $USER $JOB_NAME $BUILD_ID $BUILD_URL $BUILD_TAG > $TAG_FILE'
                sh 'cat $TAG_FILE'
                sh './staging_info'
                sh './staging_create_tag.sh $TAG_FILE'
                sh './staging_info $DEV_REPO $BUILD_TAG'
            }
        }

        // stage('Upload artifact to Staging Dev'){
        //     steps {
        //         sh './staging_info'
        //     }
        // }
    }
}


