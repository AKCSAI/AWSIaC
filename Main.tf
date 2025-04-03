provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./ec2"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.sg.sg_id
}

module "s3" {
  source = "./s3"
}

module "iam" {
  source = "./iam"
}
