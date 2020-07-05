def PATH = 'FreeSmoke.csproj'
def RESOURCE_GROUP = 'freesmoke'
def APP_NAME_DEV = 'freesmokeweb'
def AZURE_CREDENTIAL_ID = 'freesmokeService'

pipeline {
 agent any
 stages {
  stage('Clone') {
   steps {
    checkout scm
   }
  }
   stage('restore') {
   steps {
	sh(script: "dotnet restore " + PATH, returnStdout: true)
   }
  }
  stage('Tests') {
   steps {
	sh(script: "dotnet test " + PATH, returnStdout: true)
   }
  }  
  stage('Build') {
   steps {
    sh(script: "dotnet build --configuration Release " + PATH, returnStdout: true)
   }
  }
	stage('deploy') {
	steps {
	  azureWebAppPublish azureCredentialsId: "freesmokeService",
	  resourceGroup: "freesmoke" , 
	  appName: "freesmokeweb", 
	  sourceDirectory: "./"
	  }
  }
 }
}