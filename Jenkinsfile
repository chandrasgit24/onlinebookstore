pipeline {
    agent any 

    stages {
        stage('git checkout') {
            steps {
                git 'https://github.com/mvMadhan/onlinebookstore'
            }
        }
        stage('maven build') {
            steps {
                sh 'pwd '
                sh 'ls'
                sh 'cd bookstore'
                sh 'mvn package'
            }
        }
        stage('tomcat') {
            steps {
                script {
                    sh '''
                    pwd 
                    cd target
                    cp -r onlinebook* /opt/apache-tomcat-9.0.93/webapps/
                    '''
                }
            }
        }
    }
    post{
        failure {
            echo "build has failued"
        }
        success {
            echo "build executed successsfuly"
        }
    }
}

