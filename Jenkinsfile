node {
     triggers {
        githubPush() 
    }
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

    stage('Deploy') {
            steps {
                sh 'docker run -dp 3000:3000 --name getting-started getting-started '
            }
    }
}