pipeline {
    agent any

    environment {
        PATH = "C:\\Windows\\System32;${env.PATH}"
    }

    stages {
        stage('Test CMD') {
            steps {
                bat 'echo Hello from CMD!'
            }
        }
    }
}
