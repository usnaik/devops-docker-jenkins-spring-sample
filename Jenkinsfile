pipeline {
    agent any
    tools{
        maven 'maven_3_9_8'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/usnaik/devops-docker-jenkins-spring-sample']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t upendranaik/jenkins-devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'DockerHubPwd')]) {
                        sh 'docker login -u upendranaik -p ${DockerHubPwd}'
                    }
                    sh 'docker push upendranaik/jenkins-devops-integration'
                }
            }
        }

        // stage('Deploy to k8s'){
        //     steps{
        //         script{
        //             kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
        //         }
        //     }
        // }
    }
}