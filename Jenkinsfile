pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDS = credentials('docker-hub-credentials')
        REPO_DEV = "oviya253/dev"
        REPO_PROD = "oviya253/prod"
    }
    
    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t $REPO_DEV:latest .'
            }
        }
        
        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh 'echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin'
                sh 'docker push $REPO_DEV:latest'
            }
        }
        
        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin'
                sh 'docker tag $REPO_DEV:latest $REPO_PROD:latest'
                sh 'docker push $REPO_PROD:latest'
            }
        }
        
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
        }
    }
}
