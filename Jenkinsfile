pipeline {
  agent any

  stages {
    stage('Build Image') {
      steps {
        script {
          docker.build("my-nginx:latest", "-f Dockerfile.nginx .")
        }
      }
    }

    stage('Run Container') {
      steps {
        script {
          docker.image('my-nginx:latest').run('-p 8083:80 --name my-nginx-container')
        }
      }
    }

    stage('Verify') {
      steps {
        sh 'curl http://localhost:8083'
      }
    }
  }

  post {
    success {
      echo 'Nginx container was successfully built and is running on port 8083'
    }

    failure {
      echo 'Failed to build and run Nginx container'
    }
  }
}
