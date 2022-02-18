pipeline {
    agent any

    stages {
        stage('docker version') {
            steps {
                sh "echo $USER"
                sh 'docker version'
            }
        }
        stage('Delete before build start') {
            steps {
                deleteDir()
            }
        }
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Kykaryak/DevOps-Info.git'
            }
            }
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }
        stage('Build docker image') {
            steps {
            sh 'docker build -t kykaryak/DevOps-Info:1.0 .'
            }
        }
        stage('Push docker images to DockerHub') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-cred-kykaryak', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push kykaryak/DevOps-Info:1.0
                    '''
                }
            }   
            
        }
        stage('Delete docker image locally') {
            steps {
            sh 'docker rmi kykaryak/DevOps-Info:1.0'
            }
        }
    }
}
