output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = try(aws_s3_bucket_policy.static_website_bucket.id, "")
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = try(aws_s3_bucket.static_website_bucket.arn, "")
}

output "s3_bucket_policy" {
  description = "The policy of the bucket, if the bucket is configured with a policy. If not, this will be an empty string."
  value       = try(aws_s3_bucket_policy.static_website_policy.policy, "")
}


output "s3_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = try(aws_s3_bucket_website_configuration.website.website_endpoint, "")
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
  value       = try(aws_s3_bucket_website_configuration.website.website_domain, "")
}