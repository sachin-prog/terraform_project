################# VPC for 3 Tier Application ###########################


resource "aws_vpc" "vpc_3_tier" {
    cidr_block       = "${var.vpc_cidr}"
    instance_tenancy = "default"
    enable_dns_hostnames = true

  tags = {
    Name = "vpc_3_tier"
  }
}