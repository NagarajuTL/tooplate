pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nagarajutl/tooplate-website'
        KUBECONFIG = credentials('k3s-kubeconfig')  // Store in Jenkins credentials
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo.git'
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
                sh "kubectl apply -f deployment.yaml"
            }
        }
    }
}

