pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nagarajutl/tooplate-website'
        IMAGE_TAG = "${BUILD_NUMBER}"  // Use Jenkins build number for versioning
        KUBECONFIG = '/var/lib/jenkins/k3s.yaml'  // Ensure Jenkins has access
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/NagarajuTL/tooplate.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Push Image to Registry') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Update Deployment and Deploy to K3s') {
            steps {
                sh """
                sed -i 's|image: nagarajutl/tooplate-website:.*|image: nagarajutl/tooplate-website:${IMAGE_TAG}|' deployment.yaml
                kubectl --kubeconfig=$KUBECONFIG apply -f deployment.yaml
                """
            }
        }
    }
}

