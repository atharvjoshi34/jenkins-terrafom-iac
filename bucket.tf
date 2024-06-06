#Dummy changes 
resource "google_storage_bucket" "backend-bucket" {
    name = "peerless-haiku-423005-k9-jenkins"
    location = "US" 
  
}

resource "google_storage_bucket" "log-bucket" {
    name = "peerless-haiku-423005-k9-log"
    location = "US" 
  
}

