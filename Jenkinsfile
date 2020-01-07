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
                    sh 'docker --tlsverify --tlscacert=$client_c --tlscert=$server_cs --tlskey=$key_s -H=tcp://host.docker.internal:2376 ps -a'
                }
            }
        }
    }
}