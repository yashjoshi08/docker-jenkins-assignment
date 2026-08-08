pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Validate Docker Compose') {
            steps {
                sh 'docker compose config --quiet'
                echo 'Docker Compose configuration is valid'
            }
        }

        stage('Stop Existing Containers') {
            steps {
                sh 'docker compose down > /dev/null 2>&1 || true'
                echo 'Existing containers stopped'
            }
        }

        stage('Build Docker Images') {
            steps {
                sh 'docker compose build --quiet'
                echo 'Docker images built successfully'
            }
        }

        stage('Deploy Containers') {
            steps {
                sh 'docker compose up -d > /dev/null'
                echo 'Containers deployed successfully'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'docker compose ps'
            }
        }

        stage('Generate Traffic') {
            steps {
                sh '''
                    curl -s -o /dev/null -w "Request 1: HTTP %{http_code}\\n" http://localhost
                    curl -s -o /dev/null -w "Request 2: HTTP %{http_code}\\n" http://localhost
                    curl -s -o /dev/null -w "Request 3: HTTP %{http_code}\\n" http://localhost
                    curl -s -o /dev/null -w "Request 4: HTTP %{http_code}\\n" http://localhost
                '''
            }
        }

        stage('Extract Unique IPs') {
            steps {
                sh '''
                    bash scripts/extract_ips.sh |
                    sed -n '/===== Unique IPs =====/,$p'
                '''
            }
        }

        stage('Verify AWS Access') {
            steps {
                sh '''
                    echo "AWS Region: $AWS_DEFAULT_REGION"
                    aws sts get-caller-identity --query Arn --output text
                '''
            }
        }

        stage('Backup MySQL to S3') {
            steps {
                sh 'bash scripts/mysql_backup.sh > /dev/null'
                echo 'MySQL backup created and uploaded to S3 successfully'
            }
        }
    }

    post {
        success {
            echo '======================================'
            echo 'PIPELINE COMPLETED SUCCESSFULLY'
            echo '======================================'
        }

        failure {
            echo '======================================'
            echo 'PIPELINE FAILED'
            echo '======================================'
        }

        always {
            echo 'Pipeline Finished'
        }
    }
}