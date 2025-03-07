terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


module "vpc" {
  source = "./modules/networking"
  
  vpc_cidr        = var.vpc_cidr
  environment     = var.environment
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# Using the compute child module
module "ec2" {
  source = "./modules/ec2"
  
  instance_type  = var.instance_type
  instance_count = var.instance_count
  subnet_ids     = module.vpc.private_subnet_ids
  vpc_id         = module.vpc.vpc_id
  environment    = var.environment
  
  # Note how we reference outputs from the networking module
  depends_on = [module.vpc]
}

# Using the storage child module
module "s3" {
  source = "./modules/storage"
  
  bucket_name   = var.bucket_name
  environment   = var.environment
}
