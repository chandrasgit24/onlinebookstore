pipeline {
    agent { 
        label 'slave'
    }  
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    docker.image('mvmadhan/maven-docker-agent:v1').inside('--user root -v /var/run/docker.sock:/var/run/docker.sock') {
                        git 'https://github.com/mvMadhan/onlinebookstore'
                    }
                }
            }
        }
        stage('Build Application') {
            steps {
                script {
                    docker.image('mvmadhan/maven-docker-agent:v1').inside('--user root -v /var/run/docker.sock:/var/run/docker.sock') {
                        sh 'mvn package'
                    }
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
                    docker.image('mvmadhan/maven-docker-agent:v1').inside('--user root -v /var/run/docker.sock:/var/run/docker.sock') {
                        sh "docker build -t ${DOCKER_IMAGE} ."
                        docker.withRegistry('https://index.docker.io/v1/', DOCKER_CRED) {
                            sh "docker push ${DOCKER_IMAGE}"
                        }
                    }
                }
            }
        }
    }
}
