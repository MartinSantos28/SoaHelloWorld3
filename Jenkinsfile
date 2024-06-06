pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Ejecutar npm install para instalar dependencias
                script {
                    def npmHome = tool name: 'NodeJS', type: 'js'
                    def npm = "${npmHome}/bin/npm"
                    sh "${npm} install"
                }
            }
        }
        stage('Test') {
            steps {
                // Ejecutar pruebas
                script {
                    def npmHome = tool name: 'NodeJS', type: 'js'
                    def npm = "${npmHome}/bin/npm"
                    sh "${npm} test"
                }
            }
        }
        stage('Deploy') {
            steps {
                // Implementar/deploy la aplicación
                script {
                    def npmHome = tool name: 'NodeJS', type: 'js'
                    def npm = "${npmHome}/bin/npm"
                    sh "${npm} run deploy"
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
