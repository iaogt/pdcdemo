/*
Acá iría el job paraQA
esto es una pruebay
*/
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                withDockerServer([uri:'tcp://host.docker.internal:2377',credentialsId:'']){
                    // This step should not normally be used in your script. Consult the inline help for details.
                    withDockerContainer(args: '-p 3000:3000', image: 'iaogt/demorails:1.1') {
                        // some block
                    }
                }
            }
        }
    }
}