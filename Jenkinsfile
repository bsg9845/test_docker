#!groovy
pipeline{
    environment{
        registry = "bsg0108/my-image"
        registrycredentials = 'docker-credentials'
    }
    agent {label "jenkins-slave"}
    stages {
        stage("git clone"){
            steps{
                git branch: 'main', url: 'https://github.com/bsg9845/test_docker.git'
            }
        }
        stage("build image"){
            steps{
                sh "echo building a docker image"
                script{
                    image = docker.build("${registry}:$BUILD_NUMBER")
                }
            }
        }
        stage("push image"){
            steps{
                sh "echo pushing image to docker hub"
                script{
                    docker.withRegistry("",registrycredentials){
                        image.push()
                        image.push('latest')
                    }
                }
            }
        }
    }
}
