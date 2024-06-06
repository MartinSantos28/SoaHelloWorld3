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
            docker.image(DOCKER_IMAGE).inside('-u root') {
                sh 'chown -R node:node /home/node/.npm-global'
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

    post {
        always {
            script {
                // Corrige los permisos de la carpeta de caché de npm dentro del contenedor Docker
                docker.image(DOCKER_IMAGE).inside {
                    sh 'sudo chown -R node:node /home/node/.npm-global'
                }
            }
        }
    }
}
}
