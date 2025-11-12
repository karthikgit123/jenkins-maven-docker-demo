pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/karthikgit123/jenkins-maven-docker-demo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                set PATH=C:\Windows\System32;%PATH%
                set PATH=C:\Program Files\Apache\Maven\apache-maven-3.9.11\bin;%PATH%
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withServer('tcp://16.16.208.134:2375') {
                        docker.build('hello-app', '.')
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.withServer('tcp://16.16.208.134:2375') {
                        set PATH=C:\Windows\System32;%PATH%
                set PATH=C:\Program Files\Docker\Docker\resources\bin
                        bat 'docker run -d --name hello-container hello-app'
                    }
                }
            }
        }
    }
}
