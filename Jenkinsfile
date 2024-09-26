pipeline {
    agent {
        docker {
            image 'mvmadhan/maven-docker-agent:v1'
            args '--user root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage("checkout") {
            steps {
                sh 'echo file is cloned'
            }
        }
        
        stage("build") {
            steps {
                sh 'pwd ; ls'
                sh 'mvn build'
            }
        }
        
        /*
        stage("dockerbuild") {
            environment {
                docker_image = "mvmadhan/tomcat:${BUILD_NUMBER}"
            }
            steps {
                sh 'docker build -t ${docker_image} .'
            }
        }
        */
    }
}
