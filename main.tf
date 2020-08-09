module "vpc" {
  source = "./vpc"

  cluster_name = var.cluster_name
  cidr_blocks = var.cidr_blocks
  aws_region = var.aws_region
  default_tags = var.default_tags
  aws_azs = var.aws_azs
  vpc_private_subnet_cidrs = var.vpc_private_subnet_cidrs
  vpc_public_subnet_cidrs = var.vpc_public_subnet_cidrs
}

module "security-groups" {
  source = "./security-groups"

  vpc_id = module.vpc.vpc_id
  cluster_name = var.cluster_name
  aws_region = var.aws_region
  default_tags = var.default_tags
  cidr_blocks = var.cidr_blocks
}

module "iam-roles" {
  source = "./iam-roles"

  cluster_name = var.cluster_name
  aws_region = var.aws_region
  default_tags = var.default_tags
}

module "route-53" {
  source = "./route-53"

  vpc_id = module.vpc.vpc_id
  cluster_name = var.cluster_name
  aws_region = var.aws_region
  default_tags = var.default_tags
}

module "iam-roles" {
  source = "./iam-roles"

  cluster_name = var.cluster_name
  aws_region = var.aws_region
  default_tags = var.default_tags

}

