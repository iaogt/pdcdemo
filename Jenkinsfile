/*
Acá iría el job paraQA
esto es una pruebay
*/
pipeline {
    agent any

    stages {
        stage('Build') {
            echo 'Building...'
            docker.withServer('tcp://swarm.mycorp.com:2376'){
                docker.image('iaogt/demorails:1.1').withRun('-p 3000:3000')
            }
        }
    }

    always {
        cleanWs()
    }
}