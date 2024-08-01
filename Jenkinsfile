pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerHubCredentials')
        DOCKER_IMAGE = 'danielofuru/nginx'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/danielofuru/BOLE_FESTIVAL.git'
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
