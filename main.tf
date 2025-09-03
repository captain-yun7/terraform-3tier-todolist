terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  
  environment  = var.environment
  project_name = var.project_name
}

module "backend" {
  source = "./modules/backend"
  
  environment        = var.environment
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.backend_instance_type
  key_name           = var.key_name
}

module "db" {
  source = "./modules/db"
  
  environment               = var.environment
  project_name              = var.project_name
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  backend_security_group_id = module.backend.backend_security_group_id
  db_password               = var.db_password
  db_name                   = var.db_name
  db_username               = var.db_username
}

module "frontend" {
  source = "./modules/frontend"
  
  environment          = var.environment
  project_name         = var.project_name
  backend_alb_dns_name = module.backend.alb_dns_name
  s3_bucket_name       = var.frontend_bucket_name
}