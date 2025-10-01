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
        build 'DeployTodoListApp'
    }
}
