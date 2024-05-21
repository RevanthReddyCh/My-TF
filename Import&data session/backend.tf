terraform {
    backend "s3" {
        bucket = "bucketfortfstates"
        key = "tfstatefile"
        region = "us-east-2"
    }
}