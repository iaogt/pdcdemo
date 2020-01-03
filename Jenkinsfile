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
                withDockerServer([uri:'tcp://host.docker.internal:2376',credentialsId:'docker_swarm_vagrant']){
                    // This step should not normally be used in your script. Consult the inline help for details.
                    withDockerContainer(args: '-p 3000:3000', image: 'iaogt/demorails:1.1') {
                        echo 'Testing ....'
                        def output = sh returnStdout: true, script: '/usr/src/app/demo/rails test'
                        def numTests = (output =~ /(0-9)+ tests,$/ )
                        def numAssert = (output =~ /(0-9)+ assertions,$/ )
                        def numFails = (output =~ /(0-9)+ failures,$/ )
                        def numErrors = (output =~ /(0-9)+ errors,$/ )
                        def numSkips = (output =~ /(0-9)+ skips,$/ )
                    }
                }
            }
        }
    }
}