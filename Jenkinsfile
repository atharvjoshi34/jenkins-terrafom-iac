pipeline {
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('sa-pipeline-key')
         }

    triggers {
        githubPush()
    }
    
    agent {
        docker {
            image 'atharvjoshi34/terraform-iac:2.0' // Replace 'version' with desired Terraform version
            
            args "-e CLOUDSDK_CONFIG=/tmp/.config/gcloud" 
        }
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/atharvjoshi34/jenkins-terrafom-iac.git']]]) // Replace with your Git repository URL
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan'){
            steps {
                sh 'terraform plan'
            }
        }
        stage('Run Terraform Apply') {
            steps {
                script {
                    def additionalArgs = ""
                    if (env.APPLY_ARGS) {
                        additionalArgs = " " + env.APPLY_ARGS // Allows passing optional arguments via environment variable
                    }
                    sh 'terraform apply -auto-approve' + additionalArgs
                }
            }
        }
    }
}
    
