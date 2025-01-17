variable "region" {
  type = string
}

variable "profile" {
  type = string
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "aws-ia_vpc" {
  source     = "../../"
  create_vpc = false
}
