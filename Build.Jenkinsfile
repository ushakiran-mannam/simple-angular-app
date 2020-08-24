#!/usr/bin/env groovy

@Library('shared-library-s3@master') _

// Docker 
def dockerPublisherName = "ushakiran20"
def dockerRepoName = "simple-angular-app-mac"


def LocalImage = "sample-ng-app-image"

// Triggers
properties([pipelineTriggers([githubPush()])])

pipeline {
    
    agent {
        
        node {
            label 'kubepods'
        }
    }

    stages {
        
        stage('Build') {
            steps {
              container('jenkins-node'){
                sh "npm install"
                sh "npm run build"
                sh "pwd"
                sh "ls dist/sample-ng-app/"
                s3upload('dist/sample-ng-app/index.html','mytestbucket-jenkins')
                
               // sh "docker build -t ${LocalImage} ."
                }
                
            }
        }

        //stage('Publish') {
          //  steps {
            //    sh "docker tag ${LocalImage} ${dockerPublisherName}/${dockerRepoName}:v-0.0.${BUILD_NUMBER}"
              //  sh "docker tag ${LocalImage} ${dockerPublisherName}/${dockerRepoName}:latest"
                // withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
                // sh "sudo docker push ${dockerPublisherName}/${dockerRepoName}"
         //       withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-creds',
         //       usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
         //
         //       sh """
         //           echo uname=$USERNAME pwd=$PASSWORD
         //           docker login -u $USERNAME -p $PASSWORD
         //           docker push ${dockerPublisherName}/${dockerRepoName}
         //
         //           """
         //       }
         //   }
      //  }

    }
}


