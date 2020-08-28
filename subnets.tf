resource "aws_subnet" "prod_tgw_1"{
    cidr_block = var.prod_tgw_1_cidr
    vpc_id = aws_vpc.prod_tgw_vpc.id
    availability_zone = "eu-west-1a"

    tags = {
        Name = "prod_tgw_1"
    }
}

resource "aws_subnet" "prod_tgw_2"{
    cidr_block = var.prod_tgw_2_cidr
    vpc_id = aws_vpc.prod_tgw_vpc.id
    availability_zone = "eu-west-1b"

    tags  = {
        Name = "prod_tgw_2"
    }
}

resource "aws_subnet" "prod_tgw_3"{
    cidr_block = var.prod_tgw_3_cidr
    vpc_id = aws_vpc.prod_tgw_vpc.id
    availability_zone = "eu-west-1c"

    tags = {
        Name = "prod_tgw_3"
    }
}