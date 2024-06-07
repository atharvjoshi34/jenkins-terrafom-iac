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
        stage('git clone') {
            steps {
                sh 'git clone https://github.com/atharvjoshi34/jenkins-terrafom-iac.git'
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
    when {
        expression { env.BRANCH_NAME == 'main' }
    }
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
    
