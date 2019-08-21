pipeline {
    
    agent any
    
    environment {
        
        GIT_COMMITTER_NAME = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
        GIT_SHORT_COMMIT = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
        
        //GIT_NAME=$(git --no-pager show -s --format='%an' $GIT_COMMIT)
         //GIT_EMAIL=$(git --no-pager show -s --format='%ae' $GIT_COMMIT)
    }
    
   stages {
       stage(" Building the Maven Dependecy libraries") 
            {
         steps{
                echo " Hi This a Test mail from Jenkinsfile"
             echo "${env.GIT_COMMITTER_NAME}"
             echo "${env. GIT_SHORT_COMMIT}"
        
              }
           }
   }
   post {
        always {

            //emailext attachLog: true, body: "${env.PROJECT_DEFAULT_CONTENT}", mimeType: 'text/html', replyTo: "${env.PROJECT_DEFAULT_REPLYTO}", subject: "${env.PROJECT_DEFAULT_SUBJECT}", to: 'gangaram136@gmail.com'
            emailext attachLog: true, body: '''${PROJECT_NAME} - Build # ${BUILD_NUMBER} - ${BUILD_STATUS}.<br/>
<br/>
Check console <a href="${BUILD_URL}">Console Output</a> to view full results.<br/>
If you cannot connect to the build server, check the attached logs.<br/>
<br/>
--<br/>
Following is the last 100 lines of the log.<br/>
<br/>
--LOG-BEGIN--<br/>
<pre style=\'line-height: 22px; display: block; color: #333; font-family: Monaco,Menlo,Consolas,"Courier New",monospace; padding: 10.5px; margin: 0 0 11px; font-size: 13px; word-break: break-all; word-wrap: break-word; white-space: pre-wrap; background-color: #f5f5f5; border: 1px solid #ccc; border: 1px solid rgba(0,0,0,.15); -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;\'>
${BUILD_LOG, maxLines=100, escapeHtml=true}
</pre>
--LOG-END--''', mimeType: 'text/html', subject: "[\${BUILD_STATUS}] - \${PROJECT_NAME} User ${env.GIT_COMMITTER_NAME} commit ${env.GIT_SHORT_COMMIT} - Build # \${BUILD_NUMBER} (\${BUILD_ID})", to: 'gangaram136@gmail.com'
        
      
       } 
   
   success {
       
   slackSend baseUrl: 'https://devopsjenkinsgroup.slack.com/services/hooks/jenkins-ci/', channel: '#devopsjenkins', color: '#006400', failOnError: true, message: "JOB Succss: ' User ${env.GIT_COMMITTER_NAME} commit ${env.GIT_SHORT_COMMIT} '", teamDomain: 'https://devopsjenkinsgroup.slack.com', tokenCredentialId: '9644313c-9219-4111-ab98-7358eff7352c'
   
   }
   
   failure {
   
   slackSend baseUrl: 'https://devopsjenkinsgroup.slack.com/services/hooks/jenkins-ci/', channel: '#devopsjenkins', color: '#ff0000', failOnError: true, message: "JOB Failure: ' User ${env.GIT_COMMITTER_NAME} commit ${env.GIT_SHORT_COMMIT} '", teamDomain: 'https://devopsjenkinsgroup.slack.com', tokenCredentialId: '9644313c-9219-4111-ab98-7358eff7352c'
       
   }
   }
 }
