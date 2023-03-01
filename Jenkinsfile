pipeline {
  agent test

  stages {
    stage('Build Image') {
      steps {
        sh 'docker build -t nginx:test .'
      }
    }
   
}
}
