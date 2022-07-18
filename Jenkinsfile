pipeline {

    agent any

    environment {
        imageName = "612743604751.dkr.ecr.us-east-1.amazonaws.com/portfolio"
        registryCredential = "ecr:us-east-1:awscreds"
        registryUrl = "https://612743604751.dkr.ecr.us-east-1.amazonaws.com"
    }
    stages{

        stage('Fetch ansible-eks from github'){
            steps {
                git branch: 'master', url: 'https://github.com/malickhtwt/ansible-eks.git'
            }
        }

        stage('Fetch Portfolio app from github'){
            steps {
                git branch: 'master', url: 'https://github.com/malickhtwt/Portfolio.git'
            }
        }

        stage('Build Docker Image'){
            steps{
                script{
                    dockerImage = docker.build( imageName + ":$BUILD_NUMBER", "./")
                }
            }
        }

        stage('Upload App Image to ECR'){
            steps{
                script{
                    docker.withRegistry( registryUrl, registryCredential ){
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push("latest")
                    }
                }
            }

        }

    }


}
