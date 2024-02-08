pipeline {
    agent any

    environment {
        REGISTRY_URL = "docker.io"
        DOCKER_IMAGE_NAME = "ams_data"
    }

    stages {
        stage('Check Docker Version') {
            steps {
                sh 'docker --version'
            }
        }
        stage('build-branch') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'REGISTRY_CREDENTIALS', passwordVariable: 'DOCKER_CREDENTIALS_PSW', usernameVariable: 'DOCKER_CREDENTIALS_USR')]) {
                        sh 'docker login -u $DOCKER_CREDENTIALS_USR -p ${DOCKER_CREDENTIALS_PSW} ${REGISTRY_URL}'
                        def projectVersion = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()
                        sh "docker build -t ${REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${packageVersion} ."
                        sh "docker push ${REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${packageVersion}"
                    }
                }
            }
        }
    }
}