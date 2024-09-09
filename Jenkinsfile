pipeline {
    agent {
        label 'slave'
    }
    docker {
        image 'mvmadhan/maven-docker-agent:v1'
        args '--user root -v /var/run/docker.socket:/var/run/docker.socket'
    }
    stages {
        stage('Git Checkout') {
            steps {
                // Add steps for git checkout here
                checkout scm
            }
        }
        stage('Build Application') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Build and Push Docker Image') {
            environment {
                DOCKER_IMAGE = 'mvmadhan/manifest:v1'
                DOCKER_CRED = credentials('docker-cred')
            }
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CRED) {
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }
}
