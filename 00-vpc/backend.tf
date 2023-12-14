terraform {
  backend "s3" {
    bucket                  = "statefile-tf"
    key                     = "vpc"
    region                  = "ap-south-2"
  }
}