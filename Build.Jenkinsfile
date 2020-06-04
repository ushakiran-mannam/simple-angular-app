

// Docker 
def dockerPublisherName = "ushakiran20"
def dockerRepoName = "simple-angular-app"


def LocalImage = "sample-ng-app-image"

// Triggers
properties([pipelineTriggers([githubPush()])])

pipeline {
    
    agent {
        
        node {
            label 'aws_node_two'
        }
    }

    stages {
        
        stage('Build') {
            steps {
                sh "npm install"
                sh "npm run build"
                sh "pwd"
                sh "docker build -t ${LocalImage} ."
                
            }
        }

        stage('Publish') {
            steps {
                sh "sudo docker tag ${LocalImage} ${dockerPublisherName}/${dockerRepoName}:v-0.0.${BUILD_NUMBER}"
                sh "sudo docker tag ${LocalImage} ${dockerPublisherName}/${dockerRepoName}:latest"
                withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "https://hub.docker.com" ]) {
                sh "sudo docker push ${dockerPublisherName}/${dockerRepoName}"
                }
                // sh "sudo docker push ${dockerPublisherName}/${dockerRepoName}"
            }
        }

    }
}


