/*
Acá iría el job paraQA
esto es una pruebay
*/
def dockerid
pipeline {
    agent any
    stages {
        stage('Setting docker environment...') {
            steps {
                withCredentials ([file(credentialsId:'key_swarm',variable:'key_s'),file(credentialsId:'cert_s',variable:'server_cs'),file(credentialsId:'ca_s',variable:'client_c')]){
                    script{
                        dockerid = sh returnStdout:true,script:'docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 run -d -p 3000:3000 iaogt/demorails:1.3'
                        dockerid = dockerid.trim()
                        sh "docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 exec $dockerid wget --retry-connrefused --tries=100 --waitretry=5 http://localhost:3000/pedidos -O /dev/null"
                    }
                }
            }
        }
        stage('...Testing application...') {
            steps {
                withCredentials ([file(credentialsId:'key_swarm',variable:'key_s'),file(credentialsId:'cert_s',variable:'server_cs'),file(credentialsId:'ca_s',variable:'client_c')]){
                    script{
                        def output = sh returnStdout:true,script:"docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 exec $dockerid /usr/src/app/demo/bin/rails test"
                        echo "$output"
                        def (numSkips) = (output =~ /(\d)+ skips/ )	                                
                        def (numTests) = (output =~ /(\d)+ runs,/ )
                        def (numAssert) = (output =~ /(\d)+ assertions,/ )
                        def (numFails) = (output =~ /(\d)+ failures,/ )
                        def (numErrors) = (output =~ /(\d)+ errors,/ )
                        echo "Resultados: $numSkips - $numTests - $numAssert - $numFails - $numErrors"
                    }
                }
            }
        }
    }
    post{
        always {
            withCredentials ([file(credentialsId:'key_swarm',variable:'key_s'),file(credentialsId:'cert_s',variable:'server_cs'),file(credentialsId:'ca_s',variable:'client_c')]){
                script{
                    sh script:"docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 stop $dockerid"
                    sh script:"docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 rm $dockerid"
                }
            }
        }
    }
}