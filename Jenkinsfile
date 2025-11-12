cat > Jenkinsfile <<'EOF'
pipeline {
  agent any
  environment {
    DOCKER_IMAGE = "hello-app:\${BUILD_NUMBER}"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build (Maven)') {
      steps {
        sh 'mvn -B clean package'
      }
    }
    stage('Build Docker image') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
        sh 'docker images | head -n 20'
      }
    }
    stage('Run container (test)') {
      steps {
        sh '''
          docker rm -f jenkins-demo || true
          docker run --name jenkins-demo -d $DOCKER_IMAGE
          sleep 3
          docker logs jenkins-demo || true
          docker rm -f jenkins-demo || true
        '''
      }
    }
  }
  post {
    always {
      sh 'docker image prune -f || true'
    }
  }
}
EOF
