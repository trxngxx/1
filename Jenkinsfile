pipeline {

  stages {

    stage('build images') {
       when {
                branch 'main'
            }
       agent {
                node {
                    label 'test'
                    customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }

       steps {

        sh ' docker build -t nginx:v1 .'

      }

    }

  }

}
