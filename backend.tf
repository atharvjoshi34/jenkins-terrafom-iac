terraform {
  backend "gcs" {
    bucket  = "jenkins-test-iac-pipeline"
    prefix  = "terraform/state"
  }
}
