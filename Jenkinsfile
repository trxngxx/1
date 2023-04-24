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
                git 'https://github.com/user/repo.git'
                sh 'docker build -t my-nginx .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d --name my-nginx -p 80:80 -v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf my-nginx'
            }
        }
    }
}
