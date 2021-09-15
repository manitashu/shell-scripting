pipeline {
    agent any

    stages {

        stage('Terraform INIT') {
            steps {
            sh 'cd roboshop ; terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
            sh '''
            cd roboshop
            terraform apply -auto-approve
            '''
            }
        }

    }
}
