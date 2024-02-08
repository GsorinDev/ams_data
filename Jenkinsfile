pipeline {
    agent any

    environment {
        REGISTRY_URL = "docker.io"
        DOCKER_IMAGE_NAME = "ams_data"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh "docker build -t ${REGISTRY_URL}/${DOCKER_IMAGE_NAME} ."
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR')]) {
                        sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p ${DOCKERHUB_CREDENTIALS_PSW} ${REGISTRY_URL}'
                        def projectVersion = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()
                        sh "docker tag ${REGISTRY_URL}/${DOCKER_IMAGE_NAME} ${REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${projectVersion}"
                        sh "docker push ${REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${projectVersion}"
                    }
                }
            }
        }
    }
}