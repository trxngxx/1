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
        stage('Docker Push') {
            steps {
      	       withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'Tr@nngo99', usernameVariable: '29trxngxx')]) {
        	 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
           sh 'docker push trxngxx/jenkins_nginx:v3'
         }
       }
      }
    }
}
