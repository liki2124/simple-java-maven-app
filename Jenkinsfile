pipeline{
    agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }
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
