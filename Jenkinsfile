/*
Acá iría el job paraQA
esto es una pruebay
*/
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building...'
                    timeout(8){
                        echo 'Waiting for server 1 ....'
                        docker.withServer('tcp://host.docker.internal:2376','docker_swarm_vagrant'){
                            docker.image('iaogt/demorails:1.3').withRun('-p 3000:3000 -u root:root'){
                                def res = sh returnStdout: true, script: 'wget --retry-connrefused --tries=480 --waitretry=1 http://localhost:3000/pedidos -O /dev/null'
                                echo res
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
    }
}