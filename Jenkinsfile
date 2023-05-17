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
                 withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dckr_pat_jpoCKxMFDAGJrSuGS_yfrLfwkCA', usernameVariable: '29trxngxx')]) {
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                    sh 'docker tag my-nginx:latest 29trxngxx/my-nginx:jenkins-my-nginx_v2'
                    sh 'docker push 29trxngxx/my-nginx:jenkins-my-nginx_v2'
                }
            }
        }
    }
}
