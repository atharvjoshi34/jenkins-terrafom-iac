resource "google_storage_bucket" "log-bucket" {
    name = "jenkins-test-iac-pipeline-log"
    location = "US" 
  
}