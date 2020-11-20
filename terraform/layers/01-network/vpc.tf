resource "aws_vpc" "vpc" {
  cidr_block           = var.env_conf.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.env_conf.group}-${var.env_conf.env}-vpc1"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "${var.env_conf.group}-${var.env_conf.env}-vpc1-rt"
  }
}

resource "aws_main_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  vpc_id         = aws_vpc.vpc.id
}

module "public_azs" {
  source                        = "./../../modules/aws-public-az"
  vpc_id                        = aws_vpc.vpc.id
  vpc_name                      = "${var.env_conf.group}-${var.env_conf.env}-vpc1"
  availability_zones            = data.aws_availability_zones.available.names
  public_subnet_cidr            = var.cidr_block_public
  public_gateway_route_table_id = aws_route_table.main.id
}
