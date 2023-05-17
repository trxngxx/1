pipeline {
    agent {
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
                        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'Tr@nngo99', usernameVariable: '29trxngxx')]) {
                            sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                            sh 'docker tag my-nginx:latest 29trxngxx/my-nginx:jenkins-my-nginx_v1'
                            sh 'docker push 29trxngxx/my-nginx:jenkins-my-nginx_v1'
                            }
                         }
                     }
                }

    post {
         always {
             sh 'docker stop my-nginx'
             sh 'docker rm my-nginx'
         }
    }

}
