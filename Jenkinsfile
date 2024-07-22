pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage("build jar") {
            steps {
                script {
                    echo "building the application..."
                    sh 'mvn package'
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo "building the docker image..."
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: USER, passwordVariable: PWD)
                    ]) {
                        sh 'docker build -t bucha1958/pipeline_app:jma-2.0 .'
                        sh "echo $PWD | docker login -u $USER --password-stdin"
                        sh 'docker push bucha1958/pipeline_app:jma-2.0'
                    }
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "deploying the application..."
                }
            }
        }
    }
}