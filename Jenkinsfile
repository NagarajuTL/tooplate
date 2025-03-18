pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nagarajutl/tooplate-website'
        IMAGE_TAG = "${BUILD_NUMBER}"  // Versioning with Jenkins build number
        CONTAINER_NAME = 'tooplate-container'  // Name of the running container
        PORT = '8090'  // Change if needed
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

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove the existing container if it is running
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """

                    // Run the new container
                    sh """
                    docker run -d --name ${CONTAINER_NAME} -p ${PORT}:80 ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
    }
}

