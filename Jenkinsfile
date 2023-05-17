pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {     
                git 'https://github.com/trxngxx/1.git'
                sh 'docker build -t my-nginx .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d --name my-nginx -p 80:80 -v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf my-nginx'
            }
        }
          stage('Push to Docker Hub') {
            steps {
                // Bước để đăng nhập vào Docker Hub
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'Tr@nngo99', usernameVariable: '29trxngxx')]) {
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                }
                
                // Bước để đẩy hình ảnh lên Docker Hub
                sh 'docker push my-nginx:jenkins-my-nginx_v1'
            }
        }
    }
}
