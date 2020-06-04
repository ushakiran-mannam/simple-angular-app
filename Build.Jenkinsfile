

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
                // // Remove the image if it exists.
                // sh "docker rmi ${customLocalImage} || true"
                // // Build the custom image and give a custom name.
                // sh "docker build -t ${customLocalImage} ."
                // // Send message to slack.
                // sendSlackMessage "Build Successul"
                sh "npm install"
                sh "npm run build"
                // sh "docker rmi ${LocalImage} || true"
                // sh "docker build -t ${LocalImage} ."
                sh "pwd"
                sh "ls"
            }
        }

        stage('Publish') {
            steps {
                sh "docker tag ${LocalImage} ${dockerPublisherName}/${dockerRepoName}:v-0.0.${BUILD_NUMBER}"
                sh "docker tag ${LocalImage} ${dockerPublisherName}/${dockerRepoName}:latest"
                sh "docker push ${dockerPublisherName}/${dockerRepoName}"
            }
        }

        // Clean the system
        // stage('Clean') {
        //     steps {
        //         // Remove the custom image created.
        //         sh "docker rmi ${customLocalImage} || true"
        //     }
        // }

    }
}


