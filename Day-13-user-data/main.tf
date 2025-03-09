resource "aws_instance" "name" {
    instance_type = "t2.micro"
    ami = "ami-05b10e08d247fb927"
    key_name = "devopsmulticloudpractice"
    subnet_id = data.aws_subnets.default.ids[0]
    user_data = file("test.sh")
  
}