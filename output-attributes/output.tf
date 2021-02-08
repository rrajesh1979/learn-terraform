provider "aws" {
    region = "us-east-1"
}

resource "aws_eip" "eip" {
    # vpc = true
  
}

output "eip_ip" {
    value = aws_eip.eip.public_ip

}

resource "aws_s3_bucket" "mys3bucket" {
    bucket = "rrajesh1979-terraform-bucket-001"
  
}

output "bucketname" {
    value = aws_s3_bucket.mys3bucket.arn
  
}