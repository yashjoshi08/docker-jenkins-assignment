pipeline {
    agent any

    stages {

        stage('Checkout Source Code') {
            steps {
                checkout scm
            }
        }

        stage('Verify Workspace') {
            steps {
                bat 'dir'
            }
        }

        stage('Validate Docker Compose') {
            steps {
                bat 'docker compose config'
            }
        }

        stage('Stop Existing Containers') {
            steps {
                bat 'docker compose down'
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

        stage('Generate Traffic') {
            steps {
                bat '''
                curl http://localhost
                curl http://localhost
                curl http://localhost
                curl http://localhost
                '''
            }
        }

        stage('Extract Unique IP Addresses') {
            steps {
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" scripts/extract_ips.sh'
            }
        }

        stage('Check AWS Env') {
            steps {
                bat '''
                echo AWS Credentials Loaded Successfully
                echo Region: %AWS_DEFAULT_REGION%
                aws sts get-caller-identity
                '''
            }
        }

        stage('Backup MySQL to S3') {
            steps {
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" scripts/mysql_backup.sh'
            }
        }

        stage('Check AWS Credentials') {
            steps {
                bat 'aws configure list'
                bat 'aws sts get-caller-identity'
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
