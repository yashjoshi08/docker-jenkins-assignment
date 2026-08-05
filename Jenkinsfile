pipeline {
    agent any

    stages {

        stage('Checkout Source Code') {
            steps {
                checkout scm
            }
        }

        stage('Validate Docker Compose') {
            steps {
                bat 'docker compose config -q'
                echo Docker Compose configuration validated successfully.
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
                curl -s http://localhost > NUL
                curl -s http://localhost > NUL
                curl -s http://localhost > NUL
                curl -s http://localhost > NUL
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
