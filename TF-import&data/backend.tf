terraform {
  backend "s3" {
    bucket                  = "saichreddy"
    key                     = "tfstatefile"
    region                  = "us-east-1"
  }
}