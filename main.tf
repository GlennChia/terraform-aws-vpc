# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.15.1 syntax, which means it is no longer compatible with any versions below 0.15.1.
# ----------------------------------------------------------------------------------------------------------------------
######################################
# Defaults
######################################
terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "random_string" "rand4" {
  length  = 4
  special = false
  upper   = false
}

######################################
# Create VPC
######################################

module "aws_vpc" {
  source                        = "./modules/vpc"
  cidr                          = var.cidr
  public_subnet_cidrs           = var.public_subnet_cidrs
  private_subnet_a_cidrs        = var.private_subnet_a_cidrs
  private_subnet_b_cidrs        = var.private_subnet_b_cidrs
  tags                          = var.tags
  enable_dns_hostnames          = var.enable_dns_hostnames
  enable_dns_support            = var.enable_dns_support
  instance_tenancy              = var.instance_tenancy
  public_inbound_acl_rules      = var.public_inbound_acl_rules
  public_outbound_acl_rules     = var.public_outbound_acl_rules
  private_a_inbound_acl_rules   = var.private_a_inbound_acl_rules
  private_a_outbound_acl_rules  = var.private_a_outbound_acl_rules
  private_b_inbound_acl_rules   = var.private_b_inbound_acl_rules
  private_b_outbound_acl_rules  = var.private_b_outbound_acl_rules
  public_subnet_tags            = tomap(var.public_subnet_tags)
  private_subnet_tags           = tomap(var.private_subnet_tags)
  availability_zones            = var.availability_zones
  create_vpc                    = var.create_vpc
  create_igw                    = var.create_igw
  create_nat_gateways_private_a = var.create_nat_gateways_private_a
  create_nat_gateways_private_b = var.create_nat_gateways_private_b
}