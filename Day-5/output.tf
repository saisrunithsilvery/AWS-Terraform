output "instance_values" {
  value = {
    "public_ip" = aws_instance.day2.public_ip
    "private_ip" = aws_instance.day2.private_ip
  }
}

output "availability_zone" {
    value = aws_instance.day2.availability_zone
}