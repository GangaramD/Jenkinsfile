pipeline {
    agent any

    parameters {
        string(name: 'ENV' , defaultValue: "", description: 'ENV')
        string(name: 'project' , defaultValue: "", description: 'project')

    }

    stages {
       
       stage(" creating project specific tar") {
         steps{
                sh """./casenew.sh ${params.ENV} ${params.project}""" 
             
         }
       }
       
       stage(" copy project specific tar to remote host") {
         steps{
                sh """ cp -r myproj.${params.ENV}.tar.gz ~/builds """
             
         }
       }
       stage(" untar project specific tar to remote host") {
         steps{
                sh """ tar -xvf ~/builds/myproj.${params.ENV}.tar.gz -C ~/projects """
             
         }
       }
       
       /*stage(" creating a scala jar") {
         steps{
                sh 'sbt assembly'
             
         }
       }
      stage("Copy the artifact to centrilized repo or Nexus or Jfrog artifactory"){
         steps{
             sh 'echo "copy the artifact to repor" '
             sh 'sleep 5'
         }
       }       
       stage("Copy the artifact to the host server"){
         steps{
             sh ''' cd target
                    scp -r mcd.jar user@host:/deploy/artifact '''
             sh 'sleep 5' 
         }
       }

      stage("Start the Application the "){

        steps{
            sh 'ssh user@server java -jar /deploy/artifact/mcd.jar'

        }
      }*/
    }
}
