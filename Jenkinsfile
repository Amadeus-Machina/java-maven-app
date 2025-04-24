def gv

pipeline {
    agent any 
    // mvn has been installed in the jenkins container so no need for tools
    stages {
        stage ("build jar") {
            steps {
                script {
                    echo 'building the app...'
                    sh 'mvn clean install'
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo 'testing the docker image...'
                    withAWS(credentials: 'my-aws-credentials', region: 'us-east-2') {
                        sh '''
                            docker build -t java-maven-app:2.0 .
                            aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 876397106989.dkr.ecr.eu-west-2.amazonaws.com
                            docker tag java-maven-app:2.0 876397106989.dkr.ecr.eu-west-2.amazonaws.com/java-maven-app:2.0
                            docker push 876397106989.dkr.ecr.eu-west-2.amazonaws.com/java-maven-app:2.0
                        '''
                    }
                }                   
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo 'deploying the app...'
                }
            }
        }
    }
}