provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "logs" {
  bucket = "devsecops-logs-bucket"
  region = "us-east-1"
}


