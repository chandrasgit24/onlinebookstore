pipeline {
    agent { 
        label 'slave'
    }  
    stages {
        stage('Git Checkout') {
            steps {
                 docker {
                     image 'mvmadhan/maven-docker-agent:v1'
                      args '--user root -v /var/run/docker.socket:/var/run/docker.socket'
                     
                 }
            }
        }
        stage('Build Application') {
            steps {
                 docker {
                     image 'mvmadhan/maven-docker-agent:v1'
                     args '--user root -v /var/run/docker.socket:/var/run/docker.socket'
                      sh 'mvn package'
                 }
            }
        }
        stage('Build and Push Docker Image') {
            environment {
                DOCKER_IMAGE = 'mvmadhan/manifest:v1'
                DOCKER_CRED = credentials('docker-cred')
            }
            steps {
                script {
                    docker{
                        image 'mvmadhan/maven-docker-agent:v1'
                        args '--user root -v /var/run/docker.socket:/var/run/docker.socket'
                        sh "docker build -t ${DOCKER_IMAGE} ."
                        docker.withRegistry('https://index.docker.io/v1/', DOCKER_CRED) {
                            sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }
}
