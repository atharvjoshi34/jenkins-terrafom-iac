resource "google_storage_bucket" "log-bucket" {
    name = "jenkins-test-iac-pipeline-log"
    location = "US" 
  
}

resource "google_storage_bucket" "log-bucket" {
    name = "jenkins-test-iac-pipeline-branch"
    location = "US" 
  
}

resource "google_storage_bucket_iam_member" "bucket_A" {
  bucket   = "jenkins-test-iac-pipeline-log"
  role     = "roles/storage.objectCreator"  # Allows creating objects (read and write)
  member   = "serviceAccount:sa-pipeline@peerless-haiku-423005-k9.iam.gserviceaccount.com"
}
