pipeline{
   agent any;
   tools{
       maven 'maven'
       jdk 'JDK11'
   }
  stages {
          stage("Packaging"){
              steps{
                sh 'mvn package'    
              }
              
          }
          
          stage('collect artifact'){
     steps{
     archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
     }
     }
     stage('deploy to artifactory')
     {
     steps{
     
     rtUpload (
    serverId: 'ARTIFACTORY_SERVER',
    spec: '''{
          "files": [
            {
              "pattern": "target/*.jar",
              "target": "art-doc-dev-loc/sample-maven1/"
            }
         ]
    }''',
 
  
    buildName: 'sample maven',
    buildNumber: '1'
)
     }}
    }
}
