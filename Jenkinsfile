pipeline {
    agent any

    environment {
        PATH = "C:\\Windows\\System32;${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/karthikgit123/jenkins-maven-docker-demo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat '''
                echo Building with Maven...
                mvn clean package
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                echo Building Docker image...
                docker build -t myapp:latest .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                bat '''
                echo Running Docker container...
                docker run -d -p 8080:8080 myapp:latest
                '''
            }
        }
    }
}
