# Child module - storage/main.tf
resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${var.environment}"
  
  tags = {
    Name        = "${var.bucket_name}-${var.environment}"
    Environment = var.environment
  }
}

# First, set the bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Then, configure the ACL (must be done after ownership controls)
resource "aws_s3_bucket_acl" "this" {
  depends_on = [aws_s3_bucket_ownership_controls.this]
  
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}