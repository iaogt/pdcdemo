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
                    withDockerContainer(args: '-p 3000:3000 -u root:root', image: 'iaogt/demorails:1.3') {
                        timeout(8){
                            echo 'Waiting for server ....'
                            sh 'wget --retry-connrefused --tries=240 --waitretry=1 -q http://localhost:3000/pedidos -O /dev/null'
                            echo 'Testing ....'
                            script {
                                sh ''
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
    }
}