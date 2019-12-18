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
                withDockerServer([uri:'tcp://swarm.mycorp.com:2376']){
                    // This step should not normally be used in your script. Consult the inline help for details.
                    withDockerContainer(args: '-p 3000:3000', image: 'iaogt/demorails:1.1') {
                        // some block
                    }
                }
            }
        }
    }
}