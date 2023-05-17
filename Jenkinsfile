pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = credentials('29trxngxx')
        DOCKER_HUB_PASSWORD = credentials('dckr_pat_jpoCKxMFDAGJrSuGS_yfrLfwkCA')
        DOCKER_IMAGE_NAME = 'jenkins-nginx'
        DOCKER_IMAGE_TAG = 'my-nginx-v1'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/trxngxx/1.git'
            }
        }
        
        stage('Build and Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkin-nginx:my-nginx-v1 .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerHub', url: 'https://index.docker.io/v1/']) {
                    sh 'docker login -u 29trxngxx -p dckr_pat_jpoCKxMFDAGJrSuGS_yfrLfwkCA'
                    sh 'docker push jenkins-nginx:my-nginx-v1'
                }
            }
        }
    }
}
