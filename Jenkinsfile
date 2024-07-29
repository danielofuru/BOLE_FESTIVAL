pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'danielofuru/danny-bole'
        DOCKER_HUB_CREDENTIALS = 'dockerHubCredentials'
        NODE_VERSION = '14.17.6'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/danielofuru/BOLE_FESTIVAL.git'
            }
        }
        stage('Install nvm and Node.js') {
            steps {
                sh '''
                curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
                . ~/.nvm/nvm.sh
                nvm install ${NODE_VERSION}
                nvm use ${NODE_VERSION}
                node -v
                npm -v
                '''
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '''
                . ~/.nvm/nvm.sh
                nvm use ${NODE_VERSION}
                npm install
                '''
            }
        }
        stage('Build') {
            steps {
                sh '''
                . ~/.nvm/nvm.sh
                nvm use ${NODE_VERSION}
                npm run build
                '''
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

