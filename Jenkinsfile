node {
    stage('Preparation') {
        catchError(buildResult: 'SUCCESS') {
            sh 'docker stop getting-started || true'
            sh 'docker rm getting-started || true'
        }
    }

    stage('Build') {
        build 'BuildTodoListApp'
    }

    stage('Results') {
        build 'TestTodoListApp'
    }

    stage('Deploy') {
        sh 'docker build -t getting-started .'
        sh 'docker run -dp 3000:3000 --name getting-started getting-started'
    }
}
