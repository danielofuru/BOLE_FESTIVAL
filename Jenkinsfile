pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerHubCredentials')
        DOCKER_IMAGE = 'danielofuru/nginx'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Print Git version and debug info
                    sh 'git --version'
                    sh 'git config --list'
                    
                    // Clone the repository manually for debugging
                    sh 'git clone https://github.com/danielofuru/BOLE_FESTIVAL.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
