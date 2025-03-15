pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nagarajutl/tooplate-website'
        KUBECONFIG = '/var/lib/jenkins/k3s.yaml'  // Set a path Jenkins can access
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/NagarajuTL/tooplate.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Push Image to Registry') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Deploy to K3s') {
            steps {
                sh "kubectl --kubeconfig=$KUBECONFIG apply -f deployment.yaml"
            }
        }
    }
}

