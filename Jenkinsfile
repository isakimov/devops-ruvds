pipeline {
    agent { label 'RuVDS' }

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
                    url: 'https://github.com/isakimov/devops-ruvds.git'
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
            sh 'docker build -t isakimov/devops-info:1.0 .'
            }
        }
        stage('Push docker images to DockerHub') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub-cred-prod', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push isakimov/devops-info:1.0
                    '''
                }
            }   
            
        }
        stage('Delete docker image locally') {
            steps {
            sh 'docker rmi isakimov/devops-info:1.0'
            }        
        }
        stage('Deploy App') {
            steps {
                script {
                    kubernetesDeploy(configs: "devops-info-deployment.yaml", kubeconfigId: "RuVDS_config")
                }
            }
        }
    }
}
