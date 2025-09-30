node {
    stage('Preparation') {
        catchError(buildResult: 'SUCCESS') {
            sh 'docker stop getting-started'
            sh 'docker rm getting-started'
        }
    }
    stage('Build') {
        build 'BuildTodoListApp'
    }
    stage('Results') {
        build 'TestTodoListApp'
    }
}