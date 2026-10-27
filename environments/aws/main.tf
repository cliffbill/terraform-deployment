terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "aws_infrastructure" {
  # Apunta a la nueva versión v1.0.1 del módulo
  source = "git::https://github.com/cliffbill/terraform-modules.git//aws/network?ref=v1.0.1"

  name_prefix       = "prod-aws-lab"
  vpc_cidr          = "10.100.0.0/16"
  subnet_cidr       = "10.100.1.0/24"
  availability_zone = "us-east-1a" # Forzamos una zona segura para t3.micro
  instance_type     = "t3.micro"
  
  tags = {
    Environment = "production"
    Owner       = "platform-engineering"
  }
}
