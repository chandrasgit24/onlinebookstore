pipeline {
    agent any {
        tools {
            maven 'maven 3.9.9'
        }
        stages {
            stage ("git checkout"){
                steps{
                    git 'https://github.com/mvMadhan/onlinebookstore'
                }
            }
            stage ("maven build"){
                steps{
                    sh 'mvn package'
                }
            }
            stage ("tomcat"){
                steps{
                    script{
                        sh """
                        pwd 
                        cd target
                        cp -r onlinebook* /opt/apache-tomcat-9.0.93/webapps/                        
                    }
                    
                }
            }
        }
    }
}
