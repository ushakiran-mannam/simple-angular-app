// Define Variables


def dockerPublisherName = "ushakiran20"
def dockerRepoName = "simple-angular-app"

// Pipeline Triggers
properties([pipelineTriggers([upstream(threshold: 'UNSTABLE', upstreamProjects: 'sample-angular-app')])])

pipeline {
    
    agent {
        
        node {
            label 'aws_node_two'
        }
    }

    
    stages {
       
        stage('Deploy') {
            .
            steps {
                sh """
                    docker service rm simple-ng-service  || true
                    docker network create --driver overlay --attachable simple-ng-overlay || true
                    docker service create --replicas 2 --network simple-ng-overlay --name simple-ng-service -p 5000:80 ${dockerPublisherName}/${dockerRepoName}
                """
            }
        }
    }
}