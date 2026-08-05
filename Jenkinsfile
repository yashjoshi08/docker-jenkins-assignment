pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Source code checked out from GitHub'
            }
        }

        stage('Validate Docker Compose') {
            steps {
                bat 'docker compose config'
            }
        }

        stage('Build Docker Images') {
            steps {
                bat 'docker compose build'
            }
        }

        stage('Deploy Containers') {
            steps {
                bat 'docker compose up -d'
            }
        }

        stage('Verify Deployment') {
            steps {
                bat 'docker ps'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful'
        }

        failure {
            echo 'Deployment Failed'
        }

        always {
            echo 'Pipeline Finished'
        }
    }
}
