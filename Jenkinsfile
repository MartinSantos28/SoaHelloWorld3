pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'node-hello-world'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm install'
                        // También puedes instalar supertest aquí si es necesario
                        // sh 'npm install supertest --save-dev'
                        // sh 'npm test'
                    }
                }
            }
        }

         stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside('-u root') {
                        sh 'chown -R node:node /home/node/.npm-global'
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                docker.image(DOCKER_IMAGE).inside('-u root') {
                    sh 'chown -R node:node /home/node/.npm-global'
                }
            }
        }
    }
}

