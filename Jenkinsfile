pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'pipeline'
    }

    stages {
      stage ('Build') {
        steps {
          script {
            docker.build DOCKER_IMAGE
          }
        }
      }
      stage ('Test') {
        steps {
          script {
            docker.image(DOCKER_IMAGE).inside {
                    // Fix npm cache permissions
                    sh 'chown -R 995:991 "/.npm"'
                    
                    // Clean npm cache
                    sh 'npm cache clean --force'
                    
                    // Install npm dependencies
                    sh 'npm install'
                    
                    // Run tests
                    sh 'npm test'
            }
          }
        }
      }
      stage ('Deploy') {
        steps {
          script {
            docker.image(DOCKER_IMAGE).run '-p 3000:3000 -d'
          }
        }
      }
    }
}