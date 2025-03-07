resource "aws_instance" "dev-instance" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  key_name = "devopsmulticloudpractice"
  availability_zone = "us-east-1a"
  tags = {
    Name = "dev-instance"
  }
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



#implementing the state locking provision
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

