pipeline {
  agent none
  stages {

    stage('build images') {
       when {
                branch 'main'
            }
       agent {
                node {
                    label 'test'
                    customWorkspace '/home/ngo1/jenkins/multi-branch/'
                }
            }

       steps {

        sh ' docker build -t nginx:v1 .'

      }

    }

  }

}
