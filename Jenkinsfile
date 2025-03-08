pipeline {
    agent any

    environment {
        KUBECONFIG = "/var/lib/jenkins/.kube/config"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourusername/yourrepo.git'
            }
        }

        stage('Deploy to K3s') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}



