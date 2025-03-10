resource "aws_instance" "dev-instance" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  key_name = "devopsmulticloudpractice"
  subnet_id = data.aws_subnets.default.ids[0]
 
  
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