resource "aws_instance" "day2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = data.aws_subnets.default.ids[0]
    associate_public_ip_address = true
 
}

# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch all subnets for the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

