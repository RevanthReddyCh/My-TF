terraform {
    backend "s3" {
        bucket = "bucketfortfstates"
        key = "tfstatefiles-ws"
        region = "us-east-2"
    }
}