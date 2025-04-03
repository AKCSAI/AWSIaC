resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket        = "iac-demo-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "TerraformS3"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
