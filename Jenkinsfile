pipeline {
    agent any

    stages {
        stage('Check Jenkins') {
            steps {
                echo "Jenkins pipeline is running successfully!"
            }
        }

        stage('List Files') {
            steps {
                sh "ls -l"
            }
        }

        stage('Sleep Test') {
            steps {
                sh "sleep 5"
                echo "Completed sleep test!"
            }
        }
    }
}

