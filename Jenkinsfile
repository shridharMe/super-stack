pipeline {
    agent  any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '14'))
        timestamps()
    }
    stages{
   
        stage ('terraform init') {
            steps {
                script{
                  sh 'terraform init'
                  }
              }   
        }
        stage ('terraform plan') {
            steps {
                script{
                  sh 'terraform plan --out output.plan'
                }
                }
             
        }
      
        stage ('terraform apply') {
         when {
               expression { env.GIT_BRANCH == 'origin/master' }                                 
          }	
            steps {
                script{
                    sh 'terraform apply -auto-approve output.plan'
                }
            }
        }
        
    }
    post { 
        always {
            script{
                   echo " build cleanup "
            }
        }
        success { 
              script {
                      sh '''
                       echo " build successfull "
                      '''
                }
        }
        failure {
            script {
                    
                      sh '''
                       echo " build failed "
                      '''
             }
        }
    }
    
}
