pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'danielofuru/danny-bole'
        DOCKER_HUB_CREDENTIALS = 'dockerHubCredentials'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t danielofuru/danny-bole:latest .'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_HUB_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push danielofuru/danny-bole:latest'
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}

