variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch instances in"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC where resources will be created"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}