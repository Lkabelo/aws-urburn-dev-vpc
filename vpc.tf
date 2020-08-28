resource "aws_vpc" "prod_tgw_vpc"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
        Name = "prod_tgw_vpc"
    }
}
#This code will create you a VPC