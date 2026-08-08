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
                sh 'ls -la'
            }
        }

        stage('Validate Docker Compose') {
            steps {
                sh 'docker compose config'
            }
        }

        stage('Stop Existing Containers') {
            steps {
                sh 'docker compose down'
            }
        }

        stage('Build Docker Images') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy Containers') {
            steps {
                sh 'docker compose up -d'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'docker compose ps'
                sh 'docker ps'
            }
        }

        stage('Generate Traffic') {
            steps {
                sh '''
                    curl http://localhost
                    curl http://localhost
                    curl http://localhost
                    curl http://localhost
                '''
            }
        }

        stage('Extract Unique IP Addresses') {
            steps {
                sh 'bash scripts/extract_ips.sh'
            }
        }

        stage('Check AWS Env') {
            steps {
                sh '''
                    echo "AWS Credentials Loaded Successfully"
                    echo "Region: $AWS_DEFAULT_REGION"
                    aws sts get-caller-identity
                '''
            }
        }

        stage('Backup MySQL to S3') {
            steps {
                sh 'bash scripts/mysql_backup.sh'
            }
        }

        stage('Check AWS Credentials') {
            steps {
                sh 'aws configure list'
                sh 'aws sts get-caller-identity'
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