node {
    triggers {
        pollSCM('H/2 * * * *') // check elke 5 minuten
    }

    stages {
        stage('Preparation') {
            steps {
                catchError(buildResult: 'SUCCESS') {
                    sh 'docker stop getting-started || true'
                    sh 'docker rm getting-started || true'
                }
            }
        }

        stage('Build') {
            steps {
                build 'BuildTodoListApp'
            }
        }

        stage('Results') {
            steps {
                build 'TestTodoListApp'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker build -t getting-started .'
                sh 'docker run -dp 3000:3000 --name getting-started getting-started'
            }
        }
    }
}
