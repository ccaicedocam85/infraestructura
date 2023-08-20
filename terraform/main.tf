terraform {
  required_version = ">= 0.12"
     backend "s3" {
       bucket = "terraform-tfm"
       key    = "terraform-tfm"
       region = "us-east-1"
   }

}

provider "aws" {
  region = var.aws_region
}

locals {
  env = "dev"
  
}
module "vpc" {
  source = "./modules/network"

  env             = "dev"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "create_terraform" = true
  }

  public_subnet_tags = {
    "create_terraform" = true
  }
}

module "creacion_rds" {
  source = "./modules/rds"

  identifier                  = "rds-postgres-${local.env}"
  allocated_storage           = 500
  db_name                     = "postgres"
  engine                      = "postgres"
  engine_version              = "15"
  instance_class              = "db.m5.xlarge"
  manage_master_user_password = null
  username                    = "postgresad"
  password                    = "r1HHDXzLSzfPg"
  availability_zone           = "us-east-1a"
  iops                        = "12000"
  apply_immediately           = true
  network_type                = null
  vpc_security_group_ids      = [module.sg_instance.security_group_id]
  storage_type                = "gp3"
  skip_final_snapshot         = true
  final_snapshot_identifier   = true
  port                        = 1548
  db_subnet_group_name        = "db_subnet_group_gg"
  parameter_group_name        = "default.postgres15"
  subnet_ids                  = module.vpc.private_subnet_ids
  multi_az                    = true
depends_on = [ module.sg_instance, module.vpc ]
}

module "sg_instance" {
  source              = "./modules/securitygroup"
  name_security_group = "sg_instance_rds"
  vpc_id              = module.vpc.vpc_id
  ingress_rules = [
    {
      from_port       = 1548
      to_port         = 1548
      protocol        = "tcp"
      security_groups = null
      cidr_blocks     = ["0.0.0.0/0"]
      description     = "Acceso puerto oracle abierto"
    }
  ]
  egress_rules = [
    {
      from_port       = 0
      to_port         = 65535
      protocol        = "tcp"
      security_groups = null
      cidr_blocks     = ["0.0.0.0/0"]
      description     = "Allow all outbound traffic"
    }
  ]
}