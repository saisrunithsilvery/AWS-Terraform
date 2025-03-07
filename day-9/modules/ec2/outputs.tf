output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.app[*].id
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.app[*].public_ip
}
