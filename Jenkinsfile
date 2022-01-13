pipeline {
    agent  any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '14'))
        timestamps()
    }
    stages{
    
       stage ('print Params') {
        steps {
                script{
                  println params
                }
         } 
        }
        stage ('terraform init') {
            steps {
                script{
                  sh '''
                      echo "terraform init"
                    '''
                  }
              }   
        }
        stage ('terraform plan') {
            steps {
                script{
                  sh '''
                      echo "terraform plan"
                    '''
                }
                }
             
        }
        stage ('terraform test') {
            steps {
                script{
       
                  sh '''
                      echo "terraform plan"
                    '''
                }
            }
        }
        stage ('terraform apply') {
         when {
               expression { env.GIT_BRANCH == 'master' }                                 
          }	
            steps {
                script{
                    sh '''
                      echo "terraform apply"
                     '''
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
