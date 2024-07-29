pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'danielofuru/danny-bole'
        DOCKER_HUB_CREDENTIALS = 'dockerHubCredentials'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/danielofuru/BOLE-FESTIVAL.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
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
                script {
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        docker.image("${env.DOCKER_HUB_REPO}:${env.BUILD_NUMBER}").push()
                    }
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
