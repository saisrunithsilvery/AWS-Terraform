#creating vpc
resource "aws_vpc" "prod" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "prod_vpc"
    }
  
}

#creating subnet
resource "aws_subnet" "prod" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.0.0/24"
    tags={
        Name="prod_subnet"
    }

  
}
#internet gateway
resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
        Name = "prod_igw"
    }
  
}
#create route table and edit routes
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.prod.id
    route {
        gateway_id = aws_internet_gateway.prod.id
        cidr_block = "0.0.0.0/0"
    }
  
}
#associate route table with subnet

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.prod.id
    route_table_id = aws_route_table.name.id
  
}

#security group
resource "aws_security_group" "allow_tls" {

    vpc_id = aws_vpc.prod.id
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }
    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "prod_sg"
    }
}

resource "aws_instance" "prod" {
    ami = "ami-05b10e08d247fb927"
    instance_type = "t2.micro"
    key_name = "devopsmulticloudpractice"
    subnet_id = aws_subnet.prod.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
        Name = "prod_instance"
    }
  
}



