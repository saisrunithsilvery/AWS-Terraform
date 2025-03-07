output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = module.ec2.instance_ids
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.instance_public_ips
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = module.s3.bucket_arn
}