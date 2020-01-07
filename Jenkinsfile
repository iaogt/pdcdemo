/*
Acá iría el job paraQA
esto es una pruebay
*/
pipeline {
    agent any
    stages {
        stage('Setting docker environment...') {
            steps {
                withCredentials ([file(credentialsId:'key_swarm',variable:'key_s'),file(credentialsId:'cert_s',variable:'server_cs'),file(credentialsId:'ca_s',variable:'client_c')]){
                    script{
                        def dockerid = sh returnStdout:true,script:'docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 run -d -p 3000:3000 iaogt/demorails:1.3'
                        sh 'docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 exec ${dockerid} wget --retry-connrefused --tries=480 --waitretry=1 http://localhost:3000/pedidos -O /dev/null'
                        def output = sh returnStdout:true,script:'docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 exec $dockerid /usr/src/app/demo/rails test'
                        def numSkips = (output =~ /(0-9)+ skips,$/ )	                                
                        def numTests = (output =~ /(0-9)+ tests,$/ )
                        def numAssert = (output =~ /(0-9)+ assertions,$/ )
                        def numFails = (output =~ /(0-9)+ failures,$/ )
                        def numErrors = (output =~ /(0-9)+ errors,$/ )
                        echo "$output"
                    }
                }
            }
        }
    }
}