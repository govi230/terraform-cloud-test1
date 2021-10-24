terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "whoami"

    workspaces {
      name = "test1"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source         = "hack-doom/vpc/aws"
  version        = "0.0.1"
  vpc_cidr_block = "192.168.0.0/16"
  domain_name    = "hack.doom"
  rtb_cidr_block = "0.0.0.0/0"
}
