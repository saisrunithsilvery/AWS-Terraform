
terraform {
  backend "s3" {
    bucket = "srunithbucket"
    key = "terraform.tfstate"
    region = "us-east-1"    
    dynamodb_table = "terraform-state-lock"
    encrypt = true
    
  }
}