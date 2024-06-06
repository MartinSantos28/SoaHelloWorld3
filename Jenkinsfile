pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Pasos para construir tu proyecto
                script {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('Test') {
            steps {
                // Pasos para ejecutar pruebas
                script {
                    sh 'npm test'
                }
            }
        }
        stage('Deploy') {
            steps {
                // Pasos para implementar/deploy tu aplicación
                script {
                    sh 'npm run deploy'
                }
            }
        }
    }
    
    post {
        always {
            // Pasos que se ejecutan siempre, independientemente del resultado de las etapas anteriores
            echo 'Pipeline finalizado'
        }
        success {
            // Pasos que se ejecutan solo si todas las etapas anteriores son exitosas
            echo 'Pipeline exitoso'
        }
        failure {
            // Pasos que se ejecutan solo si alguna de las etapas anteriores falla
            echo 'Pipeline fallido'
        }
    }
}
