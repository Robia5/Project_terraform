terraform {
    backend "s3" {
        bucket = "robia-tfstate-bucket"
        key = "web/terraform.tfstate"
        region = "us-east-1"

        dynamodb_table = "robia-tfstate-tb"
    }
}
# Creating an S3 bucket to store static content in a prod environment
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "prod-exemple-static-website" # The unique name of the S3 bucket

}
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.static_website_bucket.arn}/*"
      }
    ]
  })
}